# frozen_string_literal: true

using Rainbow

module Onesie
  # Wraps Onesie Task
  # Responsible for checking if the Task has been ran already
  # and recording the Task
  # Prepend to the Task class prior to running
  module TaskWrapper
    def log_start_message
      @start_time = Time.current
      puts "[Onesie] STARTED #{self.class.name} at #{@start_time}".magenta
    end

    def log_end_message
      @end_time = Time.current
      puts "[Onesie] FINISHED #{self.class.name} at #{@end_time} (took #{duration.round(2)}s)".green
    end

    def duration
      @end_time - @start_time
    end

    def show_skipped_message
      return if @disable_skip_task_message

      notifier_message = "[Onesie] SKIPPED #{self.class.name} - already ran"
      puts notifier_message.yellow
      Onesie::Notifier.send_message(notifier_message) if defined?(Onesie::Notifier)
    end

    def run(manual_override: false)
      return unless allowed_environment?
      return show_skipped_message if task_record_present?
      return if manual_task? && !manual_override

      log_start_message
      super()
      record_task
      log_end_message
      notifier_message = "[Onesie] #{self.class.name} STARTED at #{@start_time} and " \
                         "FINISHED at #{@end_time} (took #{duration.round(2)}s)"
      Onesie::Notifier.send_message(notifier_message) if defined?(Onesie::Notifier)
    end
  end
end

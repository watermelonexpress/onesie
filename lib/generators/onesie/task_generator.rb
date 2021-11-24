# frozen_string_literal: true

require 'rails/generators/named_base'

module Onesie
  module Generators
    # Generates a new Onesie Task template
    class TaskGenerator < Rails::Generators::NamedBase
      desc 'Generate a new Onesie Task'
      source_root File.expand_path('./templates', __dir__)

      def create_task
        template('task.rb', filename, class_name: class_name)
      end

      private

      def filename
        "#{Onesie::TASKS_DIR}/#{task_version}_#{file_name}#{task_priority}.rb"
      end

      def task_priority
        return unless args[0]

        ".#{args[0]}"
      end

      def task_version
        Time.now.utc.strftime('%Y%m%d%H%M%S')
      end
    end
  end
end

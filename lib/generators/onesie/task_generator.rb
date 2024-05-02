# frozen_string_literal: true

require 'rails/generators/named_base'

module Onesie
  module Generators
    # Generates a new Onesie Task template
    class TaskGenerator < Rails::Generators::NamedBase
      desc 'Generate a new Onesie Task'
      source_root File.expand_path('./templates', __dir__)

      TEMPLATE_FILENAME = 'task.rb'
      DEFAULT_TEMPLATE = '# Write your Onesie Task here'

      def create_task
        template(TEMPLATE_FILENAME, filename, class_name: class_name)
      end

      private

      def filename
        "#{Onesie::Manager.tasks_path}/#{task_version}_#{file_name}#{task_priority}.rb"
      end

      def run_contents
        read_template || DEFAULT_TEMPLATE
      end

      def read_template
        $stderr.puts task_template
        task_template ? File.read(custom_template_path) : nil
      end

      def custom_template_path
        Rails.root.join('onesie', 'templates', "#{task_template}.rb")
      end

      def task_priority
        return unless priority

        ".#{priority}"
      end

      def task_version
        Time.now.utc.strftime('%Y%m%d%H%M%S')
      end

      def priority
        args[0]
      end

      def task_template
        args[1]
      end
    end
  end
end

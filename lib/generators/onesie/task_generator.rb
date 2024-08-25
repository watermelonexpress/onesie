# frozen_string_literal: true

require 'rails/generators/named_base'

module Onesie
  module Generators
    # Generates a new Onesie Task template
    class TaskGenerator < Rails::Generators::NamedBase
      desc 'Generate a new Onesie Task'
      source_root File.expand_path('./templates', __dir__)

      class_option :priority, type: :string, default: nil
      PRIORITY_ARG = 0

      class_option :template, type: :string, default: nil
      TEMPLATE_ARG = 1

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
        return unless custom_template

        Onesie::TemplateReader.read_template(custom_template_path)
      end

      def custom_template_path
        Rails.root.join('onesie', 'templates', "#{custom_template.underscore}.rb")
      end

      def task_priority
        return unless (priority = options.priority || args[PRIORITY_ARG])

        ".#{priority}"
      end

      def custom_template
        options.template || args[TEMPLATE_ARG]
      end

      def task_version
        Time.now.utc.strftime('%Y%m%d%H%M%S')
      end
    end
  end
end

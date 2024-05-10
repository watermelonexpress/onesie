# frozen_string_literal: true

require 'rails/generators/named_base'

module Onesie
  module Generators
    # Generates a new Onesie template
    class TemplateGenerator < Rails::Generators::NamedBase
      desc 'Generate a new Onesie template'
      source_root File.expand_path('./templates', __dir__)

      TEMPLATE_FILENAME = 'template.rb'

      def create_template
        template(TEMPLATE_FILENAME, filename)
      end

      private

      def filename
        "onesie/templates/#{file_name}.rb"
      end
    end
  end
end

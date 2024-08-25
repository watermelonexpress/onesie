# frozen_string_literal: true

using Rainbow

module Onesie
  # Responsible for loading custom template files
  class TemplateReader
    def self.read_template(path)
      unless File.exist?(path)
        puts "Custom Template could not be found at #{path}".red
        return
      end

      File.read(path)
    end
  end
end

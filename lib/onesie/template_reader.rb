# frozen_string_literal: true

module Onesie
  # Responsible for loading custom template files
  class TemplateReader
    def self.read_template(path)
      File.read(path)
    end
  end
end

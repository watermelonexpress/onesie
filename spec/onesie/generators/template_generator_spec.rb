# frozen_string_literal: true

require 'generator_spec'
require 'generators/onesie/template_generator'

RSpec.describe Onesie::Generators::TemplateGenerator, type: :generator do
  destination File.expand_path('../../../tmp', __dir__)
  arguments %w[ExampleTemplate]

  before do
    prepare_destination
    run_generator
  end

  it 'creates a new template file' do
    path = 'tmp/onesie/templates/example_template.rb'
    expect(File.exists?(path)).to eq(true)

    contents = File.read(path)

    expect(contents).to eq("# Write the contents of Onesie::Tasks#run here!\n")
  end
end

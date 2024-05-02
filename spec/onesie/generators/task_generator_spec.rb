# frozen_string_literal: true

require 'generator_spec'
require 'generators/onesie/task_generator'

RSpec.describe Onesie::Generators::TaskGenerator, type: :generator do
  destination File.expand_path('../../../tmp', __dir__)

  context 'when only task name is specified' do
    arguments %w[TestTask]

    it 'creates a new task file with default template' do
      allow_any_instance_of(described_class).to receive(:read_template).and_return(nil)

      prepare_destination
      run_generator

      assert_migration 'onesie/tasks/test_task.rb', /class TestTask < Onesie::Task/
      assert_migration 'onesie/tasks/test_task.rb', /# Write your Onesie Task here/
    end
  end

  context 'when template file is specified' do
    arguments ['TestTask', nil, 'example_task']

    it 'creates a new task file with the template file inside #run' do
      allow_any_instance_of(described_class).to receive(:read_template).and_return('# sample custom content')

      prepare_destination
      run_generator

      assert_migration 'onesie/tasks/test_task.rb', /class TestTask < Onesie::Task/
      assert_migration 'onesie/tasks/test_task.rb', /# sample custom content/
    end
  end
end

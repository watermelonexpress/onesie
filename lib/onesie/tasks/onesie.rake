# frozen_string_literal: true

namespace :onesie do
  desc 'List available Onesie Tasks to process'
  task describe: :environment do
    Onesie::DescribeTasks.run
  end

  # bundle exec rake onesie:new['MyTask']
  # bundle exec rake onesie:new['MyTask','high']
  # bundle exec rake onesie:new['MyTask','high','ExampleTemplateName']
  # bundle exec rake onesie:new['MyTask',,'ExampleTemplateName']
  desc 'Generates a new Onesie Task'
  task :new, [:name, :priority, :template] do |_t, args|
    name = args.fetch(:name)
    priority = args.fetch(:priority, nil)
    task_template = args.fetch(:template, nil)

    Rails::Generators.invoke('onesie:task', [name, priority, task_template])
  end

  # bundle exec rake onesie:new_template['ExampleTemplateName']
  desc 'Generates a new Onesie Template'
  task :new_template, [:filename] do |_t, args|
    filename = args.fetch(:filename)

    Rails::Generators.invoke('onesie:template', [filename])
  end

  # bundle exec rake onesie:rerun
  # bundle exec rake onesie:rerun['20220105140152_my_task']
  desc 'Rerun a Onesie Task'
  task :rerun, [:filename] => :environment do |_t, args|
    filename = args.fetch(:filename, nil)
    Onesie::Manager.new.rerun(filename: filename)
  end

  # bundle exec rake onesie:run['20220105140152_my_task']
  desc 'Manually run a specific Onesie Tasks'
  task :run, [:filename] => :environment do |_t, args|
    filename = args[:filename]
    Onesie::Manager.new.run_task(filename)
  end

  desc 'Run all unprocessed Onesie Tasks'
  task run_all: :environment do
    Onesie::Manager.new.run_all
  end

  # bundle exec rake onesie:run_tasks
  # bundle exec rake onesie:run_tasks['high']
  desc 'Run all tasks by priority level'
  task :run_tasks, [:priority_level] => :environment do |_t, args|
    priority_level = args.fetch(:priority_level, nil)
    Onesie::Manager.new.run_tasks(priority_level: priority_level)
  end
end

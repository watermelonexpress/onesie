---
title: Usage
description:
type: how_to_guide
created_at: 2021-12-21
---

# Usage

## Generate Onesie template
The first step to adding a onesie is to create a new template task. This can
be achieved with either the Rails generator or the Rake task

### Rails Generator

#### API
```
Usage:
  rails generate onesie:task NAME PRIORITY [options]

Options:
  [--skip-namespace], [--no-skip-namespace]  # Skip namespace (affects only isolated applications)

Runtime options:
  -f, [--force]                    # Overwrite files that already exist
  -p, [--pretend], [--no-pretend]  # Run but do not make any changes
  -q, [--quiet], [--no-quiet]      # Suppress status output
  -s, [--skip], [--no-skip]        # Skip files that already exist

```

#### Examples
```bash
bundle exec rails generate onesie:task MyTask      # creates a normal priority task
bundle exec rails generate onesie:task MyTask high # creates a high priority task
```

### Rake

#### API
```bash
rake onesie:new[name,priority,template]         # Generates a new Onesie Task
```

#### Examples

```bash
bundle exec rake onesie:new['MyTask']        # creates a normal priority task
bundle exec rake onesie:new['MyTask','high'] # creates a high priority task
bundle exec rake onesie:new['MyTask','high','SampleTemplate'] # creates a high priority task using 'SampleTemplate'
```

## Write your Onesie Task
The generator will create a onesie template file. The task must include the
`#run` method. Add your code to the new task file.

For details about the Task class and the class macros, see the
[Task](../explanations/task.md) document.

## Run the Onesie Task
There are three Rake tasks to assist with running onesies.

```bash
rake onesie:run[filename]              # Manually run a specific Onesie Tasks
rake onesie:run_all                    # Run all unprocessed Onesie Tasks
rake onesie:run_tasks[priority_level]  # Run all tasks by priority level
```

!!! Note
    Manual tasks must be ran individually with the `onesie:run` rake task.

### Examples

```bash
be rake onesie:run['20220105140152_my_task'] # Run 20220105140152_my_task.rb
be rake onesie:run_tasks['high']             # Run all high priority tasks
be rake onesie:run_tasks                     # Run all tasks without priority
```

## Rerunning a Task
During the development process, it may be useful to rerun a Onesie Task.
Use the `onesie:rerun` rake task to:

- Rerun the most recent Task
- Specify a Task filename to rerun a specific Task

### Examples
```bash
bundle exec rake onesie:rerun                           # Reruns the last task
bundle exec rake onesie:rerun['20220105140152_my_task'] # Reruns MyTask
```

## Describe
```bash
rake onesies:describe                  # Prints a list of available onesies to run
```

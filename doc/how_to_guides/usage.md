---
title: Usage
description:
type: how_to_guide
created_at: 2021-12-21
---

# Usage

## Generate Onesie
To create a new onesie for others to run, we ask that you use one of
the following methods to generate the file (Rails generator or rake
task) rather than creating the file yourself.

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
The following commands should occur within a v2 shell
(`dcc shell benchprep-v2`). For more information on setting up
containers, please consult our
[container setup guide](../infrastructure/how_to_guides/dev_containers/setup_guide.md).

There are a variety of existing onesie [templates](/templates.md) that may 
make your job easier. If you're writing a onesie for a common use case, take 
a look at existing templates, or consider writing your own template.

#### API
```bash
rake onesie:new[name,priority,template]         # Generates a new onesie task

```

#### Examples

```bash
bundle exec rake onesie:new['MyTask']                   # creates a normal priority task
bundle exec rake onesie:new['MyTask','high']            # creates a high priority task
bundle exec rake onesie:new['MyTask',,'SampleTemplate'] # creates a normal priority task using 'SampleTemplate'

```

## Write your onesie task
The generator will create a onesie file for you to adjust and
populate as needed. Your edits should occur mainly (if not
exclusively) within the required `#run` method.

For details about the task class and the class macros, see the
[Task](../explanations/task.md) document.

## Run the onesie task
There are three rake tasks to assist with running onesies.

```bash
rake onesie:run[filename]              # Manually run a specific onesie task
rake onesie:run_all                    # Run all unprocessed onesie tasks
rake onesie:run_tasks[priority_level]  # Run all tasks by priority level

```

!!! Note
    Manual tasks must be run individually with the `onesie:run` rake task. Running `onesie:describe` will helpfully generate the command needed to run each file as part of its listing of unprocessed tasks.

### Examples

```bash
be rake onesie:run['20220105140152_my_task'] # Run 20220105140152_my_task.rb
be rake onesie:run_tasks['high']             # Run all high-priority tasks
be rake onesie:run_all                       # Run all unprocessed tasks

```

## Re-running a task
During the development process, it may be useful to re-run a task.
Use the `onesie:rerun` rake task without an argument to re-run the most recent task, or specify a filename to re-run a specific task.

!!! Note
    As stated in the [onesie overview](../explanations/overview.md), a onesie should be _idempotent_—infinitely re-runnable without generating any errors or redundant data.

### Examples
```bash
bundle exec rake onesie:rerun                           # Re-runs the last task
bundle exec rake onesie:rerun['20220105140152_my_task'] # Re-runs MyTask

```

## Describe
```bash
rake onesie:describe # Prints a list of onesies available to run, and the commands one would use to run each

```

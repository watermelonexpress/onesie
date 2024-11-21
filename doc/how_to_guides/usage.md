---
title: Usage
description:
type: how_to_guide
created_at: 2021-12-21
---

# Usage

## Generate Onesie
To create a new Onesie for others to run, we ask that you use one of
the following methods to generate the file (Rails generator or Rake
Task) rather than creating the file yourself.

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
The following commands should occur within a V2 shell
(`dcc shell benchprep-v2`). For more information on setting up
containers, please consult our
[container setup guide](../infrastructure/how_to_guides/dev_containers/setup_guide.md).

There are a variety of existing Onesie [templates](/templates.md) that may
make your job easier. If you're writing a Onesie for a common use case, take
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

## Write Your Onesie Task
The generator will create a Onesie file for you to adjust and
populate as needed. Your edits should occur mainly (if not
exclusively) within the required `#run` method.

For details about the Task class and the class macros, see the
[Task](../explanations/task.md) document.

## Run the Onesie Task
There are three Rake Tasks to assist with running Onesies:

```bash
rake onesie:run[filename]              # Manually run a specific onesie task
rake onesie:run_all                    # Run all unprocessed onesie tasks
rake onesie:run_tasks[priority_level]  # Run all tasks by priority level

```

!!! Note
    Manual Tasks must be run individually with the `onesie:run` Rake Task. Running `onesie:describe` will helpfully generate the command needed to run each file as part of its listing of unprocessed Tasks.

### Examples

```bash
be rake onesie:run['20220105140152_my_task'] # Run 20220105140152_my_task.rb
be rake onesie:run_tasks['high']             # Run all high-priority tasks
be rake onesie:run_all                       # Run all unprocessed tasks

```

## Re-running a task
During the development process, it may be useful to re-run a Task.
Use the `onesie:rerun` Rake Task without an argument to re-run the most recent Task, or specify a filename to re-run a specific Task.

!!! Note
    As stated in the [Onesie overview](../explanations/overview.md), a Onesie should be _idempotent_—infinitely re-runnable without generating any errors or redundant data.

### Examples
```bash
bundle exec rake onesie:rerun                           # Re-runs the last task
bundle exec rake onesie:rerun['20220105140152_my_task'] # Re-runs MyTask

```

## Describe
```bash
rake onesie:describe # Prints a list of onesies available to run, and the commands one would use to run each

```

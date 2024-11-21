---
title: Templates
description:
type: how_to_guide
created_at: 2024-11-21
---

# Templates

## Overview
As you should know from our documentation of their [usage](/usage.md),
creating a Onesie already involves generating a basic template. This
section will discuss the more specifically customized templates we
create for easy re-use when we expect the core functions of a Onesie
to be repeated in the future.

## Usage

### Finding Templates To Use
Writing a Onesie for a common use-case? Check to see if a template
already exists in
[onesie/templates](https://github.com/watermelonexpress/benchprep-v2/tree/release_candidate/onesie/templates). If not, consider creating
one!

### Creating a New Template
Generating a new template file is similar to generating a Onesie.
Review Onesie [usage](/usage.md) if unsure how and where to run this
command.

#### Example
```bash
bundle exec rake onesie:new_template['NewPermission']

```

This would print `create  onesie/templates/new_permission.rb` in your
shell, and when you open your new file, you should see a single line:

```bash
# Write the contents of Onesie::Tasks#run here!

```

What you write will ultimately be placed (and indented) into the
`def run` block of any Onesie generated using your template, so don't
repeat that line or any of the other elements around it.

It can be especially helpful to spell out what variables are needed at
the top of the file and include comments that provide explanations
and/or examples. Make sure it's clear what the template's next user
will need to populate/replace.

### Creating a Onesie Using a Template File
Once you've found or created a template, use a command such as those
seen in [Onesie usage](/usage.md). Building on our example above, the
corresponding usage would be something like this:

```bash
bundle exec rake onesie:new['DEV-1234-add-new-foo-permission',,'NewPermission']

```

Now, rather than an empty `#run` method when you open the file, you
will see the contents of the template. Huzzah!

---
title: Templates
description:
type: how_to_guide
created_at: 2024-11-21
---

# Templates

## Overview
As you should know from our documentation of their [usage](/usage.md),
a onesie is already a sort of template. This guide will discuss the
more specifically customized templates that allow us to define and
easily re-use elements common among tasks of various generic types.

## Why use templates?
Templates generally consist of taking the same actions as previous
onesies and performing them on new sets of arguments. They can
make it easier for others to review your code by separating out what
we've done before and what is new about the current effort. In a
broader sense, they help us all avoid the tedium and error risk that
can occur when digging up, identifying, and ultimately copying similar
code from the past and adapting it for the needs of today.

## Usage

### Finding templates to use
Writing a onesie for a common use-case? Check to see if a template already exists in [onesie/templates](https://github.com/watermelonexpress/benchprep-v2/tree/release_candidate/onesie/templates), and if not, consider creating one!

### Creating a new template

Generating a new template is similar to generating a onesie, which you
should be familiar with from reading about onesie [usage](/usage.md).
Insead of `onesie:new`, however, you'll use
`onesie:new_template['Name']`. For example:

```bash
bundle exec rake onesie:new_template['NewPermission']

```

This would print `create  onesie/templates/new_permission.rb` in your
shell, and when you open your new file, you should see a single line:

```bash
# Write the contents of Onesie::Tasks#run here!

```

What you write will ultimately be placed (and indented)
into the `def run` block of any onesie generated using your template,
so don't repeat that line or any of the other elements around it.

It can be especially helpful to spell out what variables are needed at
the top of the file and include comments that provide explanations
and/or examples. Make sure it's clear what the template's next user will 
need to populate/replace.


### Creating a onesie using a template file
Once you've found or created a template, use a command such as those
seen in [onesie usage](/usage.md). Building on our example above, the
corresponding usage would be something like this:

```bash
bundle exec rake onesie:new['DEV-1234-add-new-foo-permission',,'NewPermission']

```

Now, rather than an empty `#run` method when you open the file, you
will see the contents of the template. Huzzah!

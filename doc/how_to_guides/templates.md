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
If you suspect that the onesie you're about to write is essentially
something we've done before (possibly several times), it can be worth
checking if there's a more specific template already available. As of
this writing, there are templates for establishing new environment
configuration variables, creating a new feature access, and creating a
new permission. You can find all the latest templates in the v2 repo,
at
[onesie/templates](https://github.com/watermelonexpress/benchprep-v2/tree/release_candidate/onesie/templates).

### Creating a new template
If you don't find an existing template that suits your needs, but
still have the feeling that you're not the first to do something (and
that you won't be the last), we hope you'll consider contributing a
new template so that the next developer can have an easier time of it.
_The time you save could be your own!_

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

As that comment says, you will now write the functional elements of
the onesie. What you write will ultimately be placed (and indented)
into the `def run` block of any onesie generated using your template,
so don't repeat that line or any of the other elements around it.

At this point, you can write the onesie contents as you normally
would, including simply pasting in the code from the last time we did
this type of task. Keep in mind, however, that you have the
opportunity to make things simpler and clearer for the next person. It
can be especially helpful to spell out what variables are needed at
the top of the file and include comments that provide explanations
and/or examples. Properly cased placeholders can help, but always be
sure it's clear what the template's next user will need to
populate/replace. Review existing templates to get a sense of best
practices.

That said, don't worry about it too much and don't let theoretical
perfection impede practical, incremental improvements! Any template is
better than none, and the future developers (including you) can
improve it further later if it's created in some form now.

### Creating a onesie using a template file
Once you've found or created a template, use a command such as those
seen in [onesie usage](/usage.md). Building on our example above, the
corresponding usage would be something like this:

```bash
bundle exec rake onesie:new['DEV-1234-add-new-foo-permission',,'NewPermission']

```

Now, rather than an empty `#run` method when you open the file, you
will see the contents of the template. Huzzah!

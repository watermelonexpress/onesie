# frozen_string_literal: true

module Onesie
  module Tasks
    class <%= class_name %> < Onesie::Task
      allowed_environments :all
      manual_task enabled: false

      def run
<%= run_contents.chomp.indent(8) %>
      end
    end
  end
end

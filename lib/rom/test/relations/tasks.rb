# frozen_string_literal: true
module Test
  module Relations
    class Tasks < ROM::Relation[:sql]
      schema(:tasks, infer: true) do
        associations do
          belongs_to :user
        end
      end
    end
  end
end

# frozen_string_literal: true
module Rom
  module MemoryTest
    module Relations
      class Tasks < ROM::Relation[:memory]
        dataset :tasks

        def for_users(users)
          restrict(user_id: users.map { |user| user[:id] })
        end
      end
    end
  end
end

# frozen_string_literal: true
module Rom
  module ArrayTest
    module Relations
      class Users < ROM::Relation[:array]
        dataset :users

        def by_name(name)
          select { |user| user[:name] == name }
        end
      end
    end
  end
end

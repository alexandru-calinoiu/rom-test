module Rom
  module MemoryTest
    module Relations
      class Users < ROM::Relation[:memory]
        dataset :users

        def by_name(name)
          restrict(name: name)
        end
      end
    end
  end
end

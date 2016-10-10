module Rom
  module Test
    module Repositories
      class TasksRepo < ROM::Repository[:tasks]
        commands :create
      end
    end
  end
end

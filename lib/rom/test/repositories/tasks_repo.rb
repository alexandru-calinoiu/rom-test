require 'rom-repository'

module Rom
  module Test
    module Repositories
      class TasksRepo < ROM::Repository[:tasks]
        commands :create

        relations :users
      end
    end
  end
end

# frozen_string_literal: true
module Rom
  module MemoryTest
    module Commands
      class CreateUser < ROM::Commands::Create[:memory]
        relation :users
        register_as :create
        result :one
      end
    end
  end
end

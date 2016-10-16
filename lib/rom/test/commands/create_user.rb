# frozen_string_literal: true
module Test
  module Commands
    class CreateUser < ROM::Commands::Create[:sql]
      relation :users
      register_as :create
      result :one
    end
  end
end

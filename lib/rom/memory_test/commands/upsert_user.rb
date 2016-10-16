# frozen_string_literal: true
module Rom
  module MemoryTest
    module Commands
      class UpsertUser < ROM::Commands::Create[:memory]
        relation :users
        register_as :upsert

        def for(user)
          @user = user
          self
        end

        def execute
          ap @user
        end
      end
    end
  end
end

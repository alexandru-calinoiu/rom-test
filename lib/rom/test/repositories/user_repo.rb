require 'rom-repository'

module Rom
  module Test
    module Repositories
      class User
        attr_reader :id, :name, :email

        def initialize(attributes)
          @id, @name, @email = attributes.values_at(:id, :name, :email)
        end
      end

      class UserRepo < ROM::Repository[:users]
        commands :create, update: :by_pk, delete: :by_pk

        def count
          users.count
        end

        def query(condition)
          users.where(condition).as(User)
        end
      end
    end
  end
end
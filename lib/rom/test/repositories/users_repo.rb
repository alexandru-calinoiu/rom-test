# frozen_string_literal: true
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

      class UsersRepo < ROM::Repository[:users]
        commands :create, update: :by_pk, delete: :by_pk

        relations :tasks

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

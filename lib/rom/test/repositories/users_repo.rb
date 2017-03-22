# frozen_string_literal: true
require 'rom-repository'
require 'dry/struct'

module Rom
  module Test
    module Repositories
      class User < Dry::Struct::Value
        attribute :id, Dry::Test::Types::Int
        attribute :name, Dry::Test::Types::String
        attribute :email, Dry::Test::Types::String
        attribute :updated_at, Dry::Test::Types::Date
        attribute :created_at, Dry::Test::Types::Date
      end

      class UsersRepo < ROM::Repository[:users]
        commands :create, update: :by_pk, delete: :by_pk

        relations :tasks

        def create_with_tasks(user)
          command(:create, aggregate(:tasks)).call(user)
        end

        def count
          users.count
        end

        def by_id(id)
          User.new(users.fetch(id))
        end

        def query(condition)
          users.where(condition).as(User)
        end
      end
    end
  end
end

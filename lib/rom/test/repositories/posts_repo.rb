# frozen_string_literal: true
require 'rom-repository'

module Rom
  module Test
    module Repositories
      class PostsRepo < ROM::Repository[:posts]
        commands :create

        relations :users

        def listing
          posts.listing.combine_parents(one: { author: users.authors })
        end
      end
    end
  end
end

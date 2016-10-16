# frozen_string_literal: true
module Rom
  module ArrayTest
    module Commands
      class Create < ROM::Commands::Create
        adapter :array
        relation :users
        register_as :create

        def execute(tuplets)
          tuplets.each { |tuplet| relation << tuplet }
        end
      end
    end
  end
end

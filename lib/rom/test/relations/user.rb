module Rom
  module Test
    module Relations
      class User < ROM::Relation[:sql]
        schema do
          attribute :id, Types::Int
          attribute :name, Types::String
          attribute :age, Types::Int
        end

        def listing
          select(:id, :name, :email).order(:name)
        end
      end
    end
  end
end
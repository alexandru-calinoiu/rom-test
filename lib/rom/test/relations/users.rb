module Rom
  module Test
    module Relations
      class Users < ROM::Relation[:sql]
        schema(infer: true) do
          associations do
            has_many :tasks
          end
        end

        def listing
          select(:id, :name, :email).order(:name)
        end
      end
    end
  end
end
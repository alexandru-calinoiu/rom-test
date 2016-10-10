module Rom
  module Test
    module Relations
      class Tasks < ROM::Relation[:sql]
        schema(infer: true) do
          associations do
            belongs_to :user
          end
        end
      end
    end
  end
end

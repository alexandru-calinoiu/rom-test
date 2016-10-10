module Rom
  module Test
    module Relations
      class Posts < ROM::Relation[:http]
        schema do
          attribute :user_id, Types::ForeignKey(:users)
        end
      end
    end
  end
end
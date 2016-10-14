# frozen_string_literal: true
module Test
  module Relations
    class Posts < ROM::Relation[:sql]
      schema(:posts, infer: true) do
        attribute :user_id, Types::ForeignKey(:users)
      end

      view(:listing, [:id, :user_id, :title, :published_at]) do
        select(:id, :title, :user_id, :published_at).order(:published_at).reverse
      end
    end
  end
end

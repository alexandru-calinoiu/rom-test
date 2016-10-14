# frozen_string_literal: true
require 'spec_helper'

RSpec.describe Rom::Test::Repositories::PostsRepo do
  let(:rom) { Rom::Test::RomSetup.new.setup }
  let(:posts_repo) { described_class.new(rom) }
  let(:users_repo) { Rom::Test::Repositories::UsersRepo.new(rom) }

  describe '#listing' do
    subject { posts_repo.listing }

    it 'works' do
      user = users_repo.create(name: 'Ion', email: 'Gheo')
      posts_repo.create(title: 'Old post', published_at: Date.today - 1, user_id: user.id)
      posts_repo.create(title: 'New post', published_at: Date.today, user_id: user.id)

      expect(subject.count).to eq 2
      expect(subject.to_a.first.title).to eq 'New post'
      expect(subject.to_a.last.title).to eq 'Old post'
    end
  end
end

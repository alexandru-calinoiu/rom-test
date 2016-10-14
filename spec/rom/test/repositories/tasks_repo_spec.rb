require 'spec_helper'

RSpec.describe Rom::Test::Repositories::TasksRepo do
  let(:rom) { Rom::Test::RomSetup.new.setup }

  describe 'aggregates user' do
    let(:user_repo) { Rom::Test::Repositories::UsersRepo.new(rom) }

    subject { described_class.new(rom).aggregate(:user) }

    it 'will return a user' do
      user = user_repo.create(name: 'Ion', email: 'ion@ion.com')
      described_class.new(rom).create(title: 'Some task', user_id: user.id)

      expect(subject.one.user.id).to eq user.id
    end
  end
end
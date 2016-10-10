require 'spec_helper'
require 'rom/test/repositories/user_repo'

RSpec.describe Rom::Test::Repositories::UserRepo do
  let(:rom) { Rom::Test::RomSetup.new.setup }
  let(:user_repo) { described_class.new(rom) }

  it 'will create/update/delete a user' do
    user = user_repo.create(name: 'Ion', email: 'jane@din.deal')
    user_repo.update(user.id, name: 'Jane')
    user_repo.delete(user.id)

    expect(user_repo.count).to eq 0
  end

  it 'will query for objects' do
    user_repo.create(name: 'Maria', email: 'maria@me.com')
    expect(user_repo.query(name: 'Maria').one!).not_to be_nil
  end
end
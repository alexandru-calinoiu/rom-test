require 'spec_helper'

RSpec.describe 'UsersRepo' do
  let(:rom) { Rom::Test::RomSetup.new.setup }
  let(:users_repo) { Rom::Test::Repositories::UsersRepo.new(rom) }
  let(:tasks_repo) { Rom::Test::Repositories::TasksRepo.new(rom) }

  it 'will create/update/delete a user' do
    user = users_repo.create(name: 'Ion', email: 'jane@din.deal')
    users_repo.update(user.id, name: 'Jane')
    users_repo.delete(user.id)

    expect(users_repo.count).to eq 0
  end

  it 'will query for objects' do
    users_repo.create(name: 'Maria', email: 'maria@me.com')
    expect(users_repo.query(name: 'Maria').one!).not_to be_nil
  end

  it 'will load tasks' do
    user = users_repo.create(name: 'Ion', email: 'ion@me.com')
    tasks_repo.create(title: 'Some taks', user_id: user.id)

    expect(users_repo.aggregate(:tasks).one[:tasks].count).to eq 1
  end
end
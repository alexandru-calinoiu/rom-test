# frozen_string_literal: true
require 'spec_helper'

RSpec.describe Rom::Test::Repositories::UsersRepo do
  let(:rom) { Rom::Test::RomSetup.new.setup }
  let(:users_repo) { described_class.new(rom) }
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

  it 'will update a user' do
    user = users_repo.create(name: 'Ion', email: 'gheo@email.com')
    changeset = users_repo
                  .changeset(user.id, name: 'Gheo')
                  .map(:add_timestamps)

    users_repo.update(user.id, changeset)
    updated_user = users_repo.by_id(user.id)

    expect(updated_user.name).to eq 'Gheo'
    expect(updated_user.created_at).not_to be_nil
    expect(updated_user.updated_at).not_to be_nil
  end

  it 'will create with tasks' do
    users_repo.create_with_tasks(name: 'Ion', email: 'ion@email.com', tasks: [{ title: 'Task1' }, { title: 'Task2' }])
    tasks = tasks_repo.tasks.to_a

    expect(tasks.count).to eq 2
  end
end

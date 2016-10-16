# frozen_string_literal: true
require 'spec_helper'

RSpec.describe 'CreateTask' do
  let(:rom) { Rom::Test::RomSetup.new.setup }
  let(:user_repo) { Rom::Test::Repositories::UsersRepo.new(rom) }
  let(:create_user) { rom.command(:users).create }
  let(:create_task) { rom.command(:tasks).create }

  it 'creates a task' do
    command = create_user.with(name: 'Ion', email: 'ion@ion.com') >> create_task.with(title: 'Awesome')
    command.call

    expect(user_repo.aggregate(:tasks).one[:tasks].count).to eq 1
  end

  it 'will rollback transactions' do
    create_user = rom.command(:users).create

    create_user.transaction do
      user = create_user.call(name: 'Ion', email: 'ion@email.com')

      if user[:id]
        create_task.with(title: 'Transaction worked?').call(user)
      else
        raise ROM::SQL::Rollback
      end

      expect(user_repo.aggregate(:tasks).one[:tasks].count).to eq 1
    end
  end
end

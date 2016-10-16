require 'spec_helper'

RSpec.describe Rom::MemoryTest::RomSetup do
  subject { described_class.new.setup }

  it { is_expected.not_to be_nil }

  it 'will combine' do
    users = subject.relation(:users)
    tasks = subject.relation(:tasks)

    users.by_name('Jane').combine(tasks.for_users)
  end

  it 'will register a custom command' do
    users_commands = subject.commands[:users]
    users_commands[:create].call(age: 42)

    user = subject.relation(:users).one

    expect(user[:age]).to eq 42
    users_commands[:upsert].for(user).call
  end
end
require 'spec_helper'

RSpec.describe Rom::MemoryTest::RomSetup do
  subject { described_class.new.setup }

  it { is_expected.not_to be_nil }

  it 'will combine' do
    users = subject.relation(:users)
    tasks = subject.relation(:tasks)

    ap users.by_name('Jane').combine(tasks.for_users)
  end
end
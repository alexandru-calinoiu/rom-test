# frozen_string_literal: true
require 'spec_helper'

RSpec.describe Rom::ArrayTest::RomSetup do
  let(:rom) { described_class.new.setup }

  it 'works' do
    users_commands = rom.commands[:users]
    users_commands[:create].call([name: 'Ion'])

    users = rom.relations[:users]

    expect(users.one[:name]).to eq 'Ion'
  end
end

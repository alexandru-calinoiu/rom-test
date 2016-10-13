require 'spec_helper'

RSpec.describe 'PostsRepo' do
  let(:rom) { Rom::Test::RomSetup.new.setup }

  subject { Rom::Test::Repositories::PostsRepo.new(rom) }

  it 'works' do
    subject.listing
  end
end
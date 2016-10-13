# frozen_string_literal: true
require 'rom/test/version'
require 'rom'

module Rom
  def self.root
    File.dirname __dir__
  end

  module Test
    autoload :RomSetup, 'rom/test/rom_setup'
    autoload :Repositories, 'rom/test/repositories'
  end
end


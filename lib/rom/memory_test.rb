# frozen_string_literal: true
require 'rom'
require 'awesome_print'

module Rom
  def self.root
    File.dirname __dir__
  end

  module MemoryTest
    autoload :RomSetup, 'rom/memory_test/rom_setup'
  end
end

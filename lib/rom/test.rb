# frozen_string_literal: true
require 'rom/test/version'
require 'rom'
require 'awesome_print'

module Rom
  def self.root
    File.dirname __dir__
  end

  module Test
    autoload :RomSetup, 'rom/test/rom_setup'
    autoload :Repositories, 'rom/test/repositories'
    autoload :Types, 'rom/test/types'
  end
end

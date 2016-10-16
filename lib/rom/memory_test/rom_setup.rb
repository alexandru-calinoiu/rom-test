# frozen_string_literal: true
require 'rom/memory'

module Rom
  module MemoryTest
    class RomSetup
      def setup
        ROM.container(:memory) do |rom|
          require 'rom/memory_test/relations/users'
          require 'rom/memory_test/relations/tasks'
          require 'rom/memory_test/commands/upsert_user'
          require 'rom/memory_test/commands/create_user'

          rom.register_relation(Rom::MemoryTest::Relations::Users)
          rom.register_relation(Rom::MemoryTest::Relations::Tasks)

          rom.register_command(Rom::MemoryTest::Commands::UpsertUser)
          rom.register_command(Rom::MemoryTest::Commands::CreateUser)
        end
      end
    end
  end
end

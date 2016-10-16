require 'rom/memory'

module Rom
  module MemoryTest
    class RomSetup
      def setup
        ROM.container(:memory) do |rom|
          require 'rom/memory_test/relations/users'
          require 'rom/memory_test/relations/tasks'

          rom.register_relation(Rom::MemoryTest::Relations::Users)
          rom.register_relation(Rom::MemoryTest::Relations::Tasks)
        end
      end
    end
  end
end

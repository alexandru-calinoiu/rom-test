# frozen_string_literal: true
module Rom
  module ArrayTest
    class RomSetup
      def setup
        ROM.container(:array) do |rom|
          require 'rom/array_test/relations/users'
          require 'rom/array_test/commands/create'

          rom.register_relation(Rom::ArrayTest::Relations::Users)
          rom.register_command(Rom::ArrayTest::Commands::Create)
        end
      end
    end
  end
end

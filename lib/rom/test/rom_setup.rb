require 'rom'

module Rom
  module Test
    class RomSetup

      def setup
        ROM.container(:sql, 'sqlite:memory') do |conf|
                  autoload :User, 'rom/test/relations/user'
                  autoload :UserRepo, 'rom/test/repositories/user_repo'
                  autoload :ProjectRepo, 'spec/rom/test/repositories/project_repo'

                  conf.default.create_table(:users) do
                    primary_key :id
                    column :name, String, null: false
                    column :email, String, null: false
                  end
                end
      end
    end
  end
end
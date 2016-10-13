module Rom
  module Test
    class RomSetup
      def setup
        ROM.container(:sql, 'sqlite:memory') do |conf|
          require 'rom/test/relations/posts'

          conf.default.create_table(:users) do
            primary_key :id
            column :name, String, null: false
            column :email, String, null: false
          end

          conf.default.create_table(:tasks) do
            primary_key :id
            foreign_key :user_id, :users
            column :title, String, null: false
          end
        end
      end
    end
  end
end
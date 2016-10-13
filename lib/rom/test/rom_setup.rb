module Rom
  module Test
    class RomSetup
      def setup
        config = ROM::Configuration.new(:sql, 'sqlite:memory') do |conf|
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

        config.auto_registration(File.join Rom.root, 'rom/test/relations')
        ROM.container(config)
      end
    end
  end
end
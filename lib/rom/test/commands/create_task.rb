module Test
  module Commands
    class CreateTask < ROM::Commands::Create[:sql]
      relation :tasks
      register_as :create
      result :one

      associates :user, key: [:user_id, :id]
    end
  end
end
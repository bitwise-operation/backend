Sequel.migration do
  change do
    create_table :users do
      primary_key :id
      String :name
      String :avatar
      String :authentication_token
    end

    create_table :matches do
      primary_key :id
      foreign_key :winner_id, :users
      foreign_key :creator_id, :users
      foreign_key :opponent_id, :users
      DateTime :scheduled_at
      Integer :count
      String :status
    end

    create_table :scores do
      primary_key :id
      foreign_key :user_id, :users
      foreign_key :match_id, :matches
      Integer :count
    end

    create_table :devices do
      primary_key :id
      foreign_key :user_id, :users
      String :token
    end
  end
end

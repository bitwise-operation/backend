Sequel.migration do
  change do
    alter_table :matches do
      drop_foreign_key :creator_id
      drop_foreign_key :opponent_id

      add_foreign_key :creator_id, :scores
      add_foreign_key :opponent_id, :scores
    end
  end
end


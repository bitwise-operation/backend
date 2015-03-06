Sequel.migration do
  change do
    alter_table :matches do
      rename_column :status, :state
    end
  end
end


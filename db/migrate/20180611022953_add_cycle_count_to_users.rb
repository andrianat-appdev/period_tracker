class AddCycleCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :cycles_count, :integer
  end
end

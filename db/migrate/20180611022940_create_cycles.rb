class CreateCycles < ActiveRecord::Migration
  def change
    create_table :cycles do |t|
      t.integer :user_id
      t.date :begin
      t.date :end
      t.integer :length
      t.text :notes

      t.timestamps

    end
  end
end

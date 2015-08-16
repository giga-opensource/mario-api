class CreateTrackers < ActiveRecord::Migration
  def change
    create_table :trackers do |t|
      t.string :name, require: true
      t.integer :project_id

      t.timestamps
    end

    add_index :trackers, :project_id
    add_index :trackers, [:project_id, :name], unique: true
  end
end

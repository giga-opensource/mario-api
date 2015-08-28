class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.integer :project_id, require: true
      t.string :name, require: true

      t.timestamps
    end

    add_index :statuses, :project_id
    add_index :statuses, [:project_id, :name], unique: true
  end
end

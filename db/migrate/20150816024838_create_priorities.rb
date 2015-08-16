class CreatePriorities < ActiveRecord::Migration
  def change
    create_table :priorities do |t|
      t.integer :project_id
      t.string :name, require: true

      t.timestamps
    end

    add_index :priorities, :project_id
    add_index :priorities, [:project_id, :name], unique: true
  end
end

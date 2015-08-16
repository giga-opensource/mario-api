class CreateTargetVersions < ActiveRecord::Migration
  def change
    create_table :target_versions do |t|
      t.string :name, require: true
      t.integer :project_id

      t.timestamps
    end

    add_index :target_versions, :project_id
    add_index :target_versions, [:project_id, :name], unique: true
  end
end

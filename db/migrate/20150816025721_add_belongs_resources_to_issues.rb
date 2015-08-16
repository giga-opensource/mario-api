class AddBelongsResourcesToIssues < ActiveRecord::Migration
  def change

    add_column :issues, :tracker_id, :integer
    add_column :issues, :priority_id, :integer
    add_column :issues, :target_version_id, :integer

    add_index :issues, :tracker_id
    add_index :issues, :priority_id
    add_index :issues, :target_version_id
  end
end

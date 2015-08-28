class AddStatusIdToIssue < ActiveRecord::Migration
  def change
    add_column :issues, :status_id, :integer

    add_index :issues, :status_id
  end
end

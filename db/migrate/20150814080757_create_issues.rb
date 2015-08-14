class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :subject
      t.integer :project_id
      t.integer :assignee_id
      t.integer :creator_id
      t.datetime :due_date

      t.timestamps
    end

    add_index :issues, :project_id
    add_index :issues, :assignee_id
    add_index :issues, :creator_id
  end
end

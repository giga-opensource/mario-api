class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :creator_id
      t.integer :kind
      t.integer :issue_id

      t.timestamps
    end

    add_index :activities, :creator_id
    add_index :activities, :issue_id
  end
end

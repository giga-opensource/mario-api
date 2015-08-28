class CreateActivityContents < ActiveRecord::Migration
  def change
    create_table :activity_contents do |t|
      t.text :original
      t.text :transformed
      t.integer :activity_id
    end

    add_index :activity_contents, :activity_id
  end
end

class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.references :attachable, polymorphic: true, require: true
      t.timestamps
    end

    add_attachment :attachments, :file

    add_index :attachments, [:attachable_id, :attachable_type]
  end
end

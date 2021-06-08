class CreateAttachments < ActiveRecord::Migration[6.1]
  def change
    create_table :attachments do |t|
      t.string  :file
      t.integer :status, default: 0
      t.bigint  :imageable_id
      t.string  :imageable_type
      t.timestamps
    end
  end
end

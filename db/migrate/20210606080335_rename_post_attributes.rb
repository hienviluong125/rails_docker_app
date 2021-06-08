class RenamePostAttributes < ActiveRecord::Migration[6.1]
  def change
    rename_column :posts, :title, :short_content
  end
end

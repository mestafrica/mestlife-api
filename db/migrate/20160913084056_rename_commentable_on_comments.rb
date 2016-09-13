class RenameCommentableOnComments < ActiveRecord::Migration[5.1]
  def change
    rename_column :comments, :commentable_type, :reactionable_type
    rename_column :comments, :commentable_id,   :reactionable_id
  end
end

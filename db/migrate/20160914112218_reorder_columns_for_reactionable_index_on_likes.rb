class ReorderColumnsForReactionableIndexOnLikes < ActiveRecord::Migration[5.1]
  def change
    remove_index :likes, [:reactionable_type, :reactionable_id]
    add_index    :likes, [:reactionable_id, :reactionable_type], using: :btree
  end
end

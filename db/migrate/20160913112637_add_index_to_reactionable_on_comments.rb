class AddIndexToReactionableOnComments < ActiveRecord::Migration[5.1]
  def change
    add_index :comments, [:reactionable_id, :reactionable_type], using: :btree
  end
end

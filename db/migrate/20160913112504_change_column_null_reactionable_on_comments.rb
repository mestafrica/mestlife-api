class ChangeColumnNullReactionableOnComments < ActiveRecord::Migration[5.1]
  def change
    change_column_null :comments, :reactionable_type, false
    change_column_null :comments, :reactionable_id,   false
  end
end

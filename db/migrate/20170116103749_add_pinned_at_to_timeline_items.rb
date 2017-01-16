class AddPinnedAtToTimelineItems < ActiveRecord::Migration[5.1]
  def change
    add_column :timeline_items, :pinned_at, :datetime
  end
end

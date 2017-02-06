class RenameColumnTimelineItemIdOnPhotos < ActiveRecord::Migration[5.1]
  def change
    rename_column :photos, :timeline_item_id, :photo_timeline_item_id
  end
end

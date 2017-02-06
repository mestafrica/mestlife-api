class AddNumberOfPhotosAttachedToTimelineItems < ActiveRecord::Migration[5.1]
  def change
    add_column :timeline_items, :number_of_photos_attached, :integer, default: 0
  end
end

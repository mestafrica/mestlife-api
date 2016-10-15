class AddDeletedAtToTimelineItems < ActiveRecord::Migration[5.1]
  def change
    add_column :timeline_items, :deleted_at, :timestamp, null: false, default: 'infinity'
  end
end

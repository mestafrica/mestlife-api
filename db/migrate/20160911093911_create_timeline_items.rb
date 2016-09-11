class CreateTimelineItems < ActiveRecord::Migration[5.1]
  def change
    create_table :timeline_items, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.timeline_item_text :item_text, null: false, default: ''
      t.text               :type,      null: false, default: ''

      t.timestamps null: false, default: -> { 'now()' }
    end
  end
end

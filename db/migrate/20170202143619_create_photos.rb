class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.text     :url,                null: false, index: :unique
      t.float    :size,               null: false, default: 0.0
      t.text     :original_file_name, null: false, default: ''
      t.timestamp :deleted_at,        null: false, default: 'infinity'

      t.references :timeline_item, foreign_key: true, type: :uuid, null: false
    end
  end
end

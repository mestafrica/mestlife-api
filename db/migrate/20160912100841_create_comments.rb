class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.comment_text :content,     null: false
      t.references   :commentable, null: false, polymorphic: true, type: :uuid
      t.timestamp    :deleted_at,  null: false, default: 'infinity'

      t.timestamps null: false, default: -> { 'now()' }
    end
  end
end

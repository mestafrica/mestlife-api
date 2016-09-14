class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.references  :reactionable, null: false, type: :uuid, polymorphic: true
      t.timestamptz :liked_at,     null: false, default: -> { 'now()' }
      t.timestamptz :unliked_at,   null: false, default: 'infinity'
    end
  end
end

class Like < ApplicationRecord
  default_scope { where(unliked_at: 'infinity') }

  before_create do
    self.liked_at = DateTime.now
  end

  belongs_to :reactionable, polymorphic: true

  validates :reactionable, presence: true
end

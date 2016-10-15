class Like < ApplicationRecord
  default_scope { where unliked_at: 'infinity' }

  before_create { self.liked_at = DateTime.now }

  belongs_to :reactionable, polymorphic: true

  validates :reactionable, presence: true
end

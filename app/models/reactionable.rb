class Reactionable < ApplicationRecord
  self.abstract_class = true

  default_scope { where deleted_at: 'infinity' }
  default_scope { order 'created_at DESC' }

  has_many :comments, as: :reactionable
  has_many :likes,    as: :reactionable
end

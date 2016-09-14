class Reactionable < ApplicationRecord
  self.abstract_class = true

  has_many :comments, as: :reactionable
  has_many :likes,    as: :reactionable
end

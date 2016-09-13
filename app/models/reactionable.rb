class Reactionable < ApplicationRecord
  self.abstract_class = true

  has_many :comments, as: :reactionable
end

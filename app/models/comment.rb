# == Schema Information
#
# Table name: comments
#
#  id               :uuid             not null, primary key
#  content          :text             not null
#  commentable_type :string           not null
#  commentable_id   :uuid             not null
#  deleted_at       :datetime         default(Infinity), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Comment < ApplicationRecord
  default_scope { where(deleted_at: 'infinity') }

  belongs_to :commentable, polymorphic: true

  validates :commentable, presence: true
  validates :content,     presence: true,
                            length: { maximum: 500 }
end

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

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

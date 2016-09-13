# == Schema Information
#
# Table name: comments
#
#  id                :uuid             not null, primary key
#  content           :text             not null
#  reactionable_type :string           not null
#  reactionable_id   :uuid             not null
#  deleted_at        :datetime         default(Infinity), not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test 'should not accept comment without content' do
    comment = Comment.new(reactionable: timeline_items(:one))
    assert_not comment.save
  end

  test 'should not accept comment without commentable' do
    comment = Comment.new(content: 'Comment that is one of its kind')
    assert_not comment.save
  end
end

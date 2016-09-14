require 'test_helper'

class LikeTest < ActiveSupport::TestCase
  test "should not like without a reactionable" do
    like = Like.new
    assert_not like.save
  end

  test "should like a reactionable" do
    like = Like.new(reactionable: text_timeline_items(:one))
    assert like.save
  end
end

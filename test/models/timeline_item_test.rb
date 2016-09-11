# == Schema Information
#
# Table name: timeline_items
#
#  id         :uuid             not null, primary key
#  item_text  :text             default(""), not null
#  type       :text             default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class TimelineItemTest < ActiveSupport::TestCase
  test 'should post without item text' do
    timeline_item = TimelineItem.new(item_text: '')
    assert timeline_item.save
  end
end

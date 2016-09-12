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

class TextTimelineItem < TimelineItem
end

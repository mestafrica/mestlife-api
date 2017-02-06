class PhotoTimelineItem < TimelineItem
  has_many :photos, dependent: :destroy
end

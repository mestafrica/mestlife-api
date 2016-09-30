class V1::TextTimelineItemResource < V1::TimelineItemResource
  class << self
    def sortable_fields(context)
      [:created_at]
    end
  end
end

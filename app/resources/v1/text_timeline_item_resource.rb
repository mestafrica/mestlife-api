class V1::TextTimelineItemResource < V1::TimelineItemResource
  attribute :text, delegate: :item_text

  attributes :created_at,
             :updated_at
end

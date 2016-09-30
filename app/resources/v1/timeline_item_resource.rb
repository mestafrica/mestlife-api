class V1::TimelineItemResource < V1::ReactionableResource
  immutable

  attributes :item_text,
             :created_at,
             :updated_at
end

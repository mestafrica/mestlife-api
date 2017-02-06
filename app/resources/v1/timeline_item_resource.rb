class V1::TimelineItemResource < V1::ReactionableResource
  immutable

  attributes :item_text,
             :created_at,
             :updated_at,
             :pinned_at,
             :number_of_photos_attached

  class << self
    def sortable_fields(context)
      [:created_at, :pinned_at]
    end
  end
end

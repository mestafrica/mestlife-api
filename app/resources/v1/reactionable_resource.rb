class V1::ReactionableResource < JSONAPI::Resource
  abstract

  has_many :comments
  has_many :likes

  class << self
    def sortable_fields(context)
      [:created_at, :pinned_at]
    end

    def default_sort
      [{field: 'created_at', direction: :desc}]
    end
  end
end
module V1
  class TimelineItemResource < JSONAPI::Resource
    immutable

    has_many :comments
  end
end

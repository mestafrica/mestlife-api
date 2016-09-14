class V1::LikeResource < JSONAPI::Resource
  attribute :liked_at

  has_one :reactionable, polymorphic: true
end

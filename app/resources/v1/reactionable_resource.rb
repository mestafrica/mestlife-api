class V1::ReactionableResource < JSONAPI::Resource
  abstract

  has_many :comments
  has_many :likes
end

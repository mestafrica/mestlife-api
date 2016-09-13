class V1::ReactionableResource < JSONAPI::Resource
  abstract

  has_many :comments
end

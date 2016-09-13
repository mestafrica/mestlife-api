class V1::CommentResource < JSONAPI::Resource
  attributes :content,
             :created_at,
             :updated_at

  has_one :reactionable, polymorphic: true
end

class V1::CommentResource < JSONAPI::Resource
  attributes :content,
             :created_at,
             :updated_at
end

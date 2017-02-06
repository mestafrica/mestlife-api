class V1::PhotoResource < JSONAPI::Resource
  attributes :url,
             :size,
             :original_file_name

  has_one :photo_timeline_item
end

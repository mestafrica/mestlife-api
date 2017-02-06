class Photo < ApplicationRecord
  belongs_to :photo_timeline_item
  
  validates :photo_timeline_item, presence: true
  validates :url,                 presence: true
  validates :size,                presence: true
  validates :original_file_name,  presence: true


  def destroy
    archive
  end
end

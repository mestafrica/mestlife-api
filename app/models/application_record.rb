class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def archive
    self.deleted_at = DateTime.now
    save
  end
end

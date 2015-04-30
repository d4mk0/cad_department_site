class Page < ActiveRecord::Base
  validates_presence_of :title, :text, :permalink
  validates_uniqueness_of :permalink

  scope :published, -> { where(published: true) }
end

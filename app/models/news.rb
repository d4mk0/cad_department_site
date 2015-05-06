class News < ActiveRecord::Base
  validates_presence_of :title, :text, :short_description

  scope :published, -> { where(published: true) }
  scope :for_front, -> { published.order('id DESC') }
end

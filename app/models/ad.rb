class Ad < ActiveRecord::Base
  paginates_per 10

  validates :title, :text, presence: true

  scope :published, -> { where(published: true) }
  scope :for_front, -> { published.order('id DESC') }

end

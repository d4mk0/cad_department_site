class Ad < ActiveRecord::Base
  validates :title, :text, presence: true

  scope :published, -> { where(published: true) }

end

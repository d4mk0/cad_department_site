class Discipline < ActiveRecord::Base
  has_many :docs
  belongs_to :user

  scope :published, -> { where(published: true) }
  scope :for_front, -> { published }

  validates_presence_of :name, :description, :user_id
end

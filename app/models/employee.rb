class Employee < ActiveRecord::Base
  acts_as_list
  mount_uploader :photo, EmployeePhotoUploader

  validates_presence_of :full_name, :post, :description

  scope :published, -> { where(published: true) }
  scope :by_position, -> { reorder('position') }
  scope :for_front, -> { published.by_position }
end

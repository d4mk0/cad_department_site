class Employee < ActiveRecord::Base
  acts_as_list
  mount_uploader :photo, EmployeePhotoUploader

  validates_presence_of :full_name, :post, :description

  scope :published, -> { where(published: true) }
  scope :by_position, -> { reorder('position') }
  scope :for_front, -> { published.by_position }

  def self.search(word)
    fields = [:full_name, :post, :academic_degree, :academic_title, :description, :contact_details]
    fields.map! { |f| "#{f} like :value"}
    published.where(fields.join(' or '), value: "%#{word}%")
  end
end

class Timetable < ActiveRecord::Base
  acts_as_list

  validates_presence_of :title, :code

  scope :published, -> { where(published: true) }
  scope :by_position, -> { reorder('position') }
  scope :for_front, -> { published.by_position }
end

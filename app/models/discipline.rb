class Discipline < ActiveRecord::Base
  has_many :docs
  belongs_to :user

  validates_presence_of :name, :description, :user_id
end

class Doc < ActiveRecord::Base
  belongs_to :user

  has_many :versions

  validates_presence_of :name, :user
end

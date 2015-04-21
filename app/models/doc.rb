class Doc < ActiveRecord::Base
  belongs_to :user

  has_many :versions, dependent: :destroy

  accepts_nested_attributes_for :versions

  validates_presence_of :name, :user

  def version_updated_at
    actual_version.created_at
  end

  def download_link
    actual_version.download_path
  end

  def actual_version
    versions.reorder('created_at DESC').first
  end
end

class Doc < ActiveRecord::Base
  belongs_to :user
  belongs_to :discipline

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

  def self.search(word)
    fields = [:name]
    fields.map! { |f| "#{f} like :value"}
    where(fields.join(' or '), value: "%#{word}%")
  end
end

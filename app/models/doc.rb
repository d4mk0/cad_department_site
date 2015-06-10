class Doc < ActiveRecord::Base
  belongs_to :user
  belongs_to :discipline

  has_many :versions, dependent: :destroy

  scope :published, -> { where(published: true) }
  scope :for_front, -> { published.joins(:versions).where.not(versions: { path: nil }).distinct }

  accepts_nested_attributes_for :versions

  validates_presence_of :name, :user, :discipline_id

  def version_updated_at
    actual_version.try(:created_at)
  end

  def download_link
    actual_version.try(:download_path)
  end

  def actual_version
    versions.for_front.reorder('created_at DESC').first
  end

  def self.search(word)
    fields = [:name]
    fields.map! { |f| "#{f} like :value"}
    where(fields.join(' or '), value: "%#{word}%")
  end

  def send_to_server
    versions.each { |v| v.send_to_ftp_server }
  end
end

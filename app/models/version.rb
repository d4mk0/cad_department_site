class Version < ActiveRecord::Base
  belongs_to :doc

  scope :for_front, -> { where.not(path: nil) }

  def file_name(real_name)
    "#{created_at.to_i}_#{id}_#{real_name}"
  end

  def download_path
    "/versions/#{path}"
  end

  def send_to_ftp_server
    FTPDocsSyncer.new.send_version self
  end

  def file_size
    File.size Rails.root.join('public', 'versions', path)
  end
end

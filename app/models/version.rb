class Version < ActiveRecord::Base
  belongs_to :doc

  def file_name(real_name)
    "#{id}_#{real_name}"
  end

  def download_path
    "/versions/#{path}"
  end
end

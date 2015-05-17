class News < ActiveRecord::Base
  validates_presence_of :title, :text, :short_description

  scope :published, -> { where(published: true) }
  scope :for_front, -> { published.order('id DESC') }

  def self.search(word)
    fields = [:title, :short_description, :text]
    fields.map! { |f| "#{f} like :value"}
    published.where(fields.join(' or '), value: "%#{word}%")
  end
end

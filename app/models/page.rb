class Page < ActiveRecord::Base
  validates_presence_of :title, :text, :permalink
  validates_uniqueness_of :permalink

  scope :published, -> { where(published: true) }

  def self.search(word)
    fields = [:title, :text, :permalink]
    fields.map! { |f| "#{f} like :value"}
    published.where(fields.join(' or '), value: "%#{word}%")
  end
end

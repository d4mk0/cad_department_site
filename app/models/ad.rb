class Ad < ActiveRecord::Base
  CATEGORIES = %w(for_all for_students for_abiturients for_teachers from_employers).freeze

  paginates_per 10

  validates :title, :text, presence: true
  validates :category, inclusion: { in: CATEGORIES }

  scope :published, -> { where(published: true) }
  scope :for_front, -> { published.order('id DESC') }
  scope :without_employers, -> { where.not(category: 'from_employers') }
  scope :from_employers, -> { where(category: 'from_employers') }

  def self.categories_options
    Ad::CATEGORIES.map { |c| [I18n.t("enums.ad_categories.#{c}"), c] }
  end

  def self.search(word)
    fields = [:title, :text]
    fields.map! { |f| "#{f} like :value"}
    published.where(fields.join(' or '), value: "%#{word}%")
  end
end

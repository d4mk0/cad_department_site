class Ad < ActiveRecord::Base
  CATEGORIES = %w(for_all for_students for_abiturients for_teachers from_employers).freeze

  paginates_per 10

  validates :title, :text, presence: true
  validates :category, inclusion: { in: CATEGORIES }

  scope :published, -> { where(published: true) }
  scope :for_front, -> { published.order('id DESC') }

  def self.categories_options
    Ad::CATEGORIES.map { |c| [I18n.t("enums.ad_categories.#{c}"), c] }
  end

end

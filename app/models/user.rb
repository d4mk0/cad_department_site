class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :docs

  validates_presence_of :first_name, :last_name, :patronymic

  def short_name
    "#{last_name.capitalize} #{first_name[0].upcase}. #{patronymic[0].upcase}"
  end

end

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  has_many :lists

  before_create :generate_auth_token

  def name
    username = self.email.split(/@/).first.humanize.titleize
  end

  def total_items
    num = 0
    self.lists.each { |list| num += list.number_of_items }
    num
  end

  def generate_auth_token
    loop do
      self.auth_token = SecureRandom.base64(64)
      break unless User.find_by(auth_token: auth_token)
    end
  end

end

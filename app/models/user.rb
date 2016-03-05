class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  has_many :lists

  def name
    username = self.email.split(/@/).first.humanize.titleize
  end

  def total_items
    num = 0
    self.lists.each do |list|
      num += list.number_of_items
    end
    return num
  end

end

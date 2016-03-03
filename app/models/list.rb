class List < ActiveRecord::Base

  belongs_to :user
  has_many :items

  default_scope { order(title: :asc) }

end

class List < ActiveRecord::Base

  belongs_to :user
  has_many :items

  default_scope { order(title: :asc) }

  def title=(s)
    write_attribute(:title, s.to_s.titleize)
  end

  def number_of_items
    Item.all.select{|item| item.list_id == self.id}.count
  end

end

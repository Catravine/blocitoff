class List < ActiveRecord::Base

  belongs_to :user
  has_many :items

  default_scope { order(title: :asc) }

  def title=(s)
    write_attribute(:title, s.to_s.titleize)
  end

  def number_of_items
    num = 0
    Item.all.each do |item|
      num +=1 if item.list_id == self.id
    end
    return num
  end

end

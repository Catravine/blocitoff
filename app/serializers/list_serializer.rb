class ListSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :title, :number_of_items, :user_id

  def number_of_items
    object.number_of_items
  end

  def created_at
    object.created_at.strftime('%B %d, %Y')
  end

end

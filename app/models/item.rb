class Item < ActiveRecord::Base
  belongs_to :user

  default_scope { order(created_at: :asc) }

  def finish_or_delete_by
    created_at.to_date + 7.days
  end

end

class Item < ActiveRecord::Base
  belongs_to :user

  def finish_or_delete_by
    #7.days.from_now.to_date
    created_at.to_date + 7.days
  end

end

namespace :todo do
  desc "Deletes expired To-Do Items (7 days old)"

  task delete_items: :environment do
    Item.where("created_at <= ?", Time.now - 7.days).destroy_all
  end

  task delete_lists: :environment do
    #List.where(List.items.count == 0).destroy_all - doesn't work.
  end

end

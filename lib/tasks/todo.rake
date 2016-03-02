namespace :todo do
  desc "Deletes expired To-Do Items (7 days old)"
  task delete_items: :environment do
    Item.where("created_at <= ?", Time.now - 7.days).destroy_all
  end

end

every 1.day, :at => '12:00 am' do
  rake "todo:delete_items"
end

every :reboot do
  rake "todo:delete_items"
end

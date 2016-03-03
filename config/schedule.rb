every :day, at: '12am' do
  rake 'todo:delete_items'
end

every :reboot do
  rake 'todo:delete_items'
end

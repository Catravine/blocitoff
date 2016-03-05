every :day, at: '12am' do
  rake 'todo:delete_items'
  rake 'todo:delete_empty_lists'
end

every :reboot do
  rake 'todo:delete_items'
  rake 'todo:delete_empty_lists'
end

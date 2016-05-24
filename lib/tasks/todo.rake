namespace :todo do
  desc "Delete 7 day old tasks"
  task delete_items: :environment do
  	Item.where("created_at <= ?", Time.now - 7.days).destroy_all
  end

end

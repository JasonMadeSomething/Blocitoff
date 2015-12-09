namespace :todo do
  desc "Delete items inactive for a month"
  task delete_items: :environment do
    Item.where("deactivated_at <= ?", Date.today - 30).destroy_all
  end

  desc "Archive items that have been active for a week"
  task archive_items: :environment do
    Item.where("activated_at <= ?", Date.today - 7).each do |i| 
      i.deactivate(:archived)
      i.save
    end
  end

end

module ItemsHelper
  
  def inactive?(item)
    !(item.active?)
  end
  
  def time_to_archive(activated_at)
    distance_of_time_in_words(Date.today, activated_at + 7)
  end
  
  def time_to_delete(deactivated_at)
    distance_of_time_in_words(Date.today, deactivated_at + 30)
  end
end

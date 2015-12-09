class AddDeactivatedAtToItems < ActiveRecord::Migration
  def change
    add_column :items, :deactivated_at, :date
  end
end

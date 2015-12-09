class AddActivatedAtToItems < ActiveRecord::Migration
  def change
    add_column :items, :activated_at, :date
  end
end

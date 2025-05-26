class AddDeliveryTimesToRewards < ActiveRecord::Migration[8.0]
  def change
    add_column :rewards, :delivery_times, :text
  end
end

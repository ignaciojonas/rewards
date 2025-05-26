class CreateRewards < ActiveRecord::Migration[8.0]
  def change
    create_table :rewards do |t|
      t.string :recipient
      t.references :reward_type, null: false, foreign_key: true
      t.decimal :amount
      t.datetime :sent_at
      t.integer :status, default: 0, null: false

      t.timestamps
    end
  end
end

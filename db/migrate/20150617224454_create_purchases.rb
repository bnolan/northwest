class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.string :name, :venue_id, :venue_name, :venue_address
      t.text :comment
      t.references :user, :venue
      t.float :latitude, :longitude

      t.timestamps null: false
    end
  end
end

class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :user, :purchase
      t.timestamps null: false
    end
  end
end

class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.boolean :private, null: false, default: false
      t.attachment :image
      t.timestamps null: false
    end
  end
end

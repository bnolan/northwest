class AddPurchaseIdToPhotos < ActiveRecord::Migration
  def change
    change_table :photos do |t|
      t.references :purchase
    end
  end
end

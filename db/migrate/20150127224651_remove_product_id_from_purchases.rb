class RemoveProductIdFromPurchases < ActiveRecord::Migration
  def change
    remove_column(:purchases, :product_id, :integer)
    add_column(:products, :purchase_id, :integer)
  end
end

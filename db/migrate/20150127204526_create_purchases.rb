class CreatePurchases < ActiveRecord::Migration
  def change
    create_table(:purchases) do |t|
      t.column(:product_id, :integer)

      t.timestamps()
    end
    add_column(:products, :purchase_id, :integer)
  end
end

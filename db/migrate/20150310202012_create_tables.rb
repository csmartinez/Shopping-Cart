class CreateTables < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.column :name, :string
      t.column :price, :float
      t.timestamps null: false
    end
    create_table :purchases do |t|
      t.timestamps null: false
    end
    add_column :products, :purchase_id, :integer
    add_column :purchases, :purchase_date, :datetime
    add_column :purchases, :product_id, :integer
  end
end

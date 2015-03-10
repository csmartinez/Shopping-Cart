require('spec_helper')

describe(Purchase) do
  it("has many products") do
    purchase = Purchase.create()
    product1 = Product.create({:name =>"coffee", :purchase_id => purchase.id})
    expect(purchase.products()).to(eq([product1]))
  end
  describe(:total) do
    it("computes sum of products") do
      purchase = Purchase.create()
      product1 = Product.create({:name =>"coffee", :price => 3.00, :purchase_id => purchase.id})
      product2 = Product.create({:name =>"pizza", :price => 4.00, :purchase_id => purchase.id})
      expect(purchase.total()).to(eq(7.00))
    end
  end
end

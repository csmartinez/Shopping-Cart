class Purchase < ActiveRecord::Base
  has_many(:products)

  define_method(:total) do
    total = Product.sum(:price)
    total
 end
end

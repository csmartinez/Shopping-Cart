class Purchase < ActiveRecord::Base
  has_many(:products)

  define_method(:total) do
    total = self.products().add()
    total
  end
end

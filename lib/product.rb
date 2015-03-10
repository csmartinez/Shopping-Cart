class Product < ActiveRecord::Base
  belongs_to(:purchases)
  validates(:name, {:presence => true})
  validates(:price, {:presence => true})
end

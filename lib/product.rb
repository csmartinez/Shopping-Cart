class Product < ActiveRecord::Base
  belongs_to(:purchases)
  validates(:description, {:presence => true})
end

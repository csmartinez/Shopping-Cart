require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("sinatra/activerecord")
require("./lib/purchase")
require("./lib/product")


require("pg")

get('/') do
 erb(:index)
end

get('/manager') do
  @products = Product.all()
  erb(:manager)
end

post('/manager') do
  name = params.fetch("name")
  price = params.fetch("price")
  @products = Product.create({:name => name, :price => price})
  redirect('/manager')
  erb(:manager)
end

get('/customer') do
  @products = Product.all()
  erb(:customer)
end

post('/cart') do
  selected_product_ids_array = params.fetch("product_ids")
  @selected_products_array = []
  selected_product_ids_array.each() do |product_id|
    @selected_products_array.push(Product.find(product_id))
  end
  erb(:cart)
end

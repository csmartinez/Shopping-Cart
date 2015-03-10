require('bundler/setup')
Bundler.require(:default, :test)
Dir[File.dirname(__FILE__) + "/../lib/*.rb"].each { |file| require file }

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

get('/clear') do
  Product.all.each do |product|
    product.destroy
  end
  redirect '/manager'
end

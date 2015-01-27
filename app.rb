require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("sinatra/activerecord")
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
  description = params.fetch("description")
  price = params.fetch("price")
  @products = Product.create({:description => description, :price => price})
  redirect('/manager')
  erb(:manager)
end

get('/customer') do
  @products = Product.all()
  erb(:customer)
end

get('/cart') do
  @purchases = Purchase.all()
  erb(:cart)
end

get('/post') do
  erb(:cart)
end

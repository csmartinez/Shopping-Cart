ENV['RACK-ENV'] = 'test'

require('bundler/setup')
Bundler.require(:default, :test)

Dir[File.dirname(__FILE__) + "/../lib/*.rb"].each { |file| require file }

RSpec.configure do |config|
  config.after(:each) do
    Product.all().each() do |product|
      product.destroy()
    end
    Purchase.all().each() do |purchase|
      purchase.destroy()
    end
  end
end

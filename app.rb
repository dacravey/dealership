require('sinatra')
require('sinatra/reloader')
also_require('lib/**/*.rb')
require('.lib/vehicle')

get('/') do
  @vehicles = Vehicle.all()
  erb(:index)
end

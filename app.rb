require_relative "config/application"
require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"
require "pry-byebug"

# router + controller

get "/" do
  # "Hello batch 1190!"
  @restaurants = Restaurant.all
  erb :index
end

# /restaurants/1
get "/restaurants/:id" do
  id = params[:id]
  @restaurant = Restaurant.find(id)
  erb :show
end

post "/restaurants" do
  name = params[:name]
  city = params[:city]
  restaurant = Restaurant.new(name: name, city: city)
  restaurant.save
  redirect "/"
end

# GET to get data 
# POST to create/add data
# PUT/PATCH update
# DELETE 

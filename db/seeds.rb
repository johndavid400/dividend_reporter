# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
#

User.create(:username => "jd", :email => "jd@jd.com", :password => "123", :password_confirmation => "123")
User.create(:username => "dog", :email => "dog@dog.com", :password => "123", :password_confirmation => "123")
User.create(:username => "pop", :email => "pop@pop.com", :password => "123", :password_confirmation => "123")
User.create(:username => "tom", :email => "tom@tom.com", :password => "123", :password_confirmation => "123")
User.create(:username => "jim", :email => "jim@jim.com", :password => "123", :password_confirmation => "123")

Stock.create(:symbol => "CFP")
Stock.create(:symbol => "DVF")
Stock.create(:symbol => "EOS")
Stock.create(:symbol => "NRO")
Stock.create(:symbol => "PHK")
Stock.create(:symbol => "HSA")
Stock.create(:symbol => "GGN")
Stock.create(:symbol => "VKI")
Stock.create(:symbol => "RIT")
Stock.create(:symbol => "NIO")
Stock.create(:symbol => "AFB")
Stock.create(:symbol => "DHF")

Role.create(:role => "admin")
Role.create(:role => "normal")

UserStock.create(:user_id => "1", :stock_id => "1")
UserStock.create(:user_id => "1", :stock_id => "2")
UserStock.create(:user_id => "1", :stock_id => "3")
UserStock.create(:user_id => "1", :stock_id => "4")
UserStock.create(:user_id => "1", :stock_id => "5")

UserStock.create(:user_id => "2", :stock_id => "6")
UserStock.create(:user_id => "2", :stock_id => "7")
UserStock.create(:user_id => "2", :stock_id => "8")
UserStock.create(:user_id => "2", :stock_id => "9")
UserStock.create(:user_id => "2", :stock_id => "10")

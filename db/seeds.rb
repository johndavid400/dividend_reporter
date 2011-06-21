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

Stock.create(:name => "Google.com", :symbol => "goog")
Stock.create(:name => "Yahoo.com", :symbol => "yhoo")
Stock.create(:name => "Walmart.com", :symbol => "walm")
Stock.create(:name => "Target.com", :symbol => "targ")

Role.create(:role => "admin")
Role.create(:role => "normal")

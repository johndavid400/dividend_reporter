class Stock < ActiveRecord::Base
  require 'yahoofinance'

  has_many :user_stocks
  has_many :users, :through => :user_stocks
end

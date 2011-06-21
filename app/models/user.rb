class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
  authenticates_with_sorcery!

  has_many :user_stocks
  has_many :stocks, :through => :user_stocks

  has_many :user_roles
  has_many :roles, :through => :user_roles

  validates_confirmation_of :password, :on => :create, :message => "should match confirmation"
end


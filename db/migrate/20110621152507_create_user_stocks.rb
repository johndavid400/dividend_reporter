class CreateUserStocks < ActiveRecord::Migration
  def self.up
    create_table :user_stocks do |t|
      t.integer :user_id
      t.integer :stock_id
      
      t.timestamps
    end
  end

  def self.down
    drop_table :user_stocks
  end
end

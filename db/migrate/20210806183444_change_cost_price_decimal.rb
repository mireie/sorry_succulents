class ChangeCostPriceDecimal < ActiveRecord::Migration[5.2]
  def self.up
    change_column :products, :cost,  :decimal, :precision => 8, :scale => 2
    change_column :products, :price,  :decimal, :precision => 8, :scale => 2
  end

  def self.down
    change_column :products, :cost, :integer
    change_column :products, :price, :integer
  end
end

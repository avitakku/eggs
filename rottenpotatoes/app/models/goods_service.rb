class GoodsService < ActiveRecord::Base
  def others_by_same_connection
    GoodsService.where(connection: self.connection).where.not(id: self.id)
  end
  
  def self.with_connection(connection)
    where(connection: connection)
  end

  def self.all_categories
    ['Good', 'Service']  
  end

  def self.with_categories(categories)
    where(category: categories)
  end
end

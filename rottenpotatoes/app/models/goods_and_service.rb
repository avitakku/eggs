class GoodsAndService < ActiveRecord::Base
  belongs_to :user, class_name: 'UserInformation', foreign_key: 'user_id', primary_key: 'user_id'

  def self.all_categories
    ['Good', 'Service']  
  end

  def self.with_categories(categories)
    categories_codes = categories.map { |category| category == "Good" ? 0 : 1 }
    where(category: categories_codes)
  end  
end

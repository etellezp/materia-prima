class Demand < ApplicationRecord
  belongs_to :user

  pg_search_scope :search_demand, :against => :name 
end

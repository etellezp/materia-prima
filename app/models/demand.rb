class Demand < ApplicationRecord
  include PgSearch
  belongs_to :user

  pg_search_scope :search_demand, :against => :name
end

class Supply < ApplicationRecord
  include PgSearch

  belongs_to :user

  pg_search_scope :search_supply, against: [:name]
  
end

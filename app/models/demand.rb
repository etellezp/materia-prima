class Demand < ApplicationRecord
  belongs_to :user

  scope :search, ->(demand_name) { where("name ILIKE ?", "%#{demand_name}%") }
end

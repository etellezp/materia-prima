class Supply < ApplicationRecord

  belongs_to :user

  scope :search, ->(supply_name) { where("name ILIKE ?", "%#{supply_name}%") }
end

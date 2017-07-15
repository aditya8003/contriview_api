class County < ApplicationRecord
  has_one :population, dependent: :destroy
  belongs_to :american_state
end

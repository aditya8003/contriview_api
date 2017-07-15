class County < ApplicationRecord
  has_many :populations, dependent: :destroy
  belongs_to :american_state
end

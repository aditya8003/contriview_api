class AmericanState < ApplicationRecord
  has_many :populations
  has_many :counties
end

class TaxClient < ApplicationRecord
  has_many :fiscal_years
  accepts_nested_attributes_for :fiscal_years
end

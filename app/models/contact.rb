class Contact < ApplicationRecord
  has_many :financial_movements

  validates_presence_of :name
end

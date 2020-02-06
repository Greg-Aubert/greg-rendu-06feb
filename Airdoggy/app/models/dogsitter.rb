class Dogsitter < ApplicationRecord
  has_many :stralls
  has_many :dogs, through: :stralls
  belongs_to :city
end

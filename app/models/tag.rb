class Tag < ApplicationRecord
  has_many :gossips, through: :connects
end

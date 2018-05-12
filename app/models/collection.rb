class Collection < ApplicationRecord
  has_many :notes, dependent: :destroy
end

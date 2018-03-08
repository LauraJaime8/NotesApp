class Note < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3 }#Presence valida que el elemento no este vacio
  validates :content, presence: true
end

class Restaurant < ApplicationRecord
  has_many  :reviews, dependent: :destroy

  validates :name, :address, :phone_number, :category, presence: true
  validates :phone_number, numericality: true
end

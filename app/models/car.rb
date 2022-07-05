class Car < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy

  has_one_attached :photo

  validates :name, presence: true
  validates :brand, presence: true

end

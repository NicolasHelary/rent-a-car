class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :pp

  has_many :cars, dependent: :destroy
  has_many :reservations, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true

end

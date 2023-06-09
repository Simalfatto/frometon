class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :pseudo, presence: true

  has_many :reviews
  has_many :forbiddens
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

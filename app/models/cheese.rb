class Cheese < ApplicationRecord
  has_many :bookmarks
  has_many :reviews, as: :reatable
  has_many :recipes
  has_many :forbidden

  validates :name, presence: true
  validates :affinage, presence: true
  validates :lait, presence: true
  validates :pate, presence: true
  validates :saison, presence: true
  validates :category, presence: true
  validates :picture_url, presence: true
  validates :description_1, presence: true
  validates :description_2, presence: true
  validates :filter_pregnant, inclusion: { in: [true, false] }
  validates :filter_vache, inclusion: { in: [true, false] }
  validates :filter_chevre, inclusion: { in: [true, false] }
  validates :filter_brebis, inclusion: { in: [true, false] }
  validates :filter_AOP, inclusion: { in: [true, false] }
  validates :wine, presence: true
end

class Cheese < ApplicationRecord
  has_many :bookmarks
  has_many :reviews
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
  validates :filter_pregnant, presence: true
  validates :filter_vache, presence: true
  validates :filter_chevre, presence: true
  validates :filter_brebis, presence: true
  validates :filter_AOP, presence: true
  validates :wine, presence: true
end

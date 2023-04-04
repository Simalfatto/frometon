class Cheese < ApplicationRecord
  has_many :bookmarks
  has_many :reviews
  has_many :recipes
  has_many :forbidden

  geocoded_by :region
  after_validation :geocode, if: :will_save_change_to_address?

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

  def average_rating_cheese
    sum_rating = self.reviews.pluck(:rating).sum.to_f
    count_rating = self.reviews.pluck(:rating).count
    (sum_rating / count_rating).to_i
  end
end

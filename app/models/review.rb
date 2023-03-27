class Review < ApplicationRecord
  belongs_to :cheese
  belongs_to :user

  AUTHORIZED_RATINGS = (0..5)

  validates :review_content, presence: true
  validates :review_rating, inclusion: { in: AUTHORIZED_RATINGS }
end

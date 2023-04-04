class Review < ApplicationRecord
  belongs_to :cheese
  belongs_to :user

  AUTHORIZED_RATINGS = (0..5)

  validates :content, presence: true
  validates :rating, inclusion: { in: AUTHORIZED_RATINGS }
end

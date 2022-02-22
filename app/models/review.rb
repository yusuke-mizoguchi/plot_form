class Review < ApplicationRecord
  belongs_to :user
  belongs_to :novel

  validates :good_point, presence: true
end

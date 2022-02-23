class Review < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :novel, dependent: :destroy

  validates :good_point, presence: true
end

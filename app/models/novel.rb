class Novel < ApplicationRecord
  belongs_to :user
  has_many :character, dependent: :destroy
  has_many :review, dependent: :destroy
end

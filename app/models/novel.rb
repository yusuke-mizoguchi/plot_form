class Novel < ApplicationRecord
  belongs_to :user

  validates :title, length: { maximumn: 50 }, uniqueness: true

  enum :genre { high_fantasy: 0, low_fantasy: 10, classic: 20, love: 30, comedy: 40, mystery:50,
                reincarnation: 50, speace_fantasy: 60, horror: 70 }
  enum :story_length { long: 0, middle: 1, short: 2 }
end

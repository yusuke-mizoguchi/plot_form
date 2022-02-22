class Character < ApplicationRecord
  belongs_to :novel

  validates :character, length: { maximumn: 2000 }, presence: true
  validates :character_role, length: { maximumn:10 }, presence: true
end

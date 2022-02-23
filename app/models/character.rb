class Character < ApplicationRecord
  belongs_to :novel, dependent: :destroy

  validates :character, length: { maximumn: 2000 }
  validates :character_role, length: { maximumn:10 }
end

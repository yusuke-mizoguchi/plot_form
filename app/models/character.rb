class Character < ApplicationRecord
  belongs_to :novel

  validates :character, length: { maximum: 2000 }
  validates :character_role, length: { maximum:10 }
end

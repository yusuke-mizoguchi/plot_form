class User < ApplicationRecord
  has_many :novel, dependent: :destroy
  has_many :review, dependent: :destroy

  authenticates_with_sorcery!

  validates :password, length: { minimum: 4, maximum: 15 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :name, presence: true
  validates :email, uniqueness: true, presence: true
  validates :role, presence: true
  

  enum role: { reader: 0,  writer: 10, guest: 20}
end

class Character < ApplicationRecord
  belongs_to :novel, optional: true
end

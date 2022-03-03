class NovelCreateForm
  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :title, :genre, :story_length, :plot, :image, :character_role, :character

  #characterのバリデーション
  validates :character, length: { maximum: 2000 }
  validates :character_role, length: { maximum:10 }

  def save
    return false unless valid?
    novel = Novel.new(title: title, genre: genre, story_length: story_length, plot: plot, image: image)
    novel.save!
    Character.create(character_role: character_role, character: character)
  end
end

class NovelCreateForm
  include ActiveModel::Model

  #novelのカラム
  attribute :title, :string
  attribute :genre, :enum
  attribute :story_length, :enum
  attribute :plot, :text
  attribute :image, :string

  #characterのカラム
  attribute :character_role, :string
  attribute :character, :text

  #novelのバリデーション、enum
  validates :title, length: { maximum: 50 }, uniqueness: true, presence: true
  validates :plot, length: { maximum: 5000 }, presence: true

  enum genre: { high_fantasy: 0, low_fantasy: 10, classic: 20, love: 30, comedy: 40, mystery:50,
                reincarnation: 50, speace_fantasy: 60, horror: 70 }
  enum story_length: { long: 0, middle: 1, short: 2 }

  #characterのバリデーション
  validates :character, length: { maximum: 2000 }
  validates :character_role, length: { maximum:10 }

  def save
    return false unless valid?
    novel = Novel.new(titile: title, genre: genre, story_length: story_length, plot:, plot, image: image)
    novel.save

    character = novel.character.build(character_role: character_role, character: character)
    character.save
  end
end
class NovelCreateForm
  include ActiveModel::Model
  include ActiveModel::Attributes
  include ActiveModel::Validations

  attribute :title, :string
  attribute :genre, :integer
  attribute :story_length, :integer
  attribute :image, :string
  attribute :character_role, :string
  attribute :user_id, :integer

#attributeがtextに対応していない為切り分け。実装されたら変更
  attr_accessor :plot, :character

  #characterのバリデーション
  validates :character, length: { maximum: 2000 }
  validates :character_role, length: { maximum:20 }

  def save
    return false unless valid?
    novel = Novel.new(title: title, genre: genre, story_length: story_length, plot: plot, image: image, user_id: user_id)
    novel.save
    Character.create(character_role: character_role, character: character)
  end
end

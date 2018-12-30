class Word < ApplicationRecord
  validates :word, uniqueness: true
  before_save :downcase_word

  scope :active, -> { where active: true }
  scope :inactive, -> { where active: false }

  private

  def downcase_word
    self.word.downcase!
  end
end

class AddSentenceToWords < ActiveRecord::Migration[5.0]
  def change
    add_column :words, :sentence, :text
  end
end

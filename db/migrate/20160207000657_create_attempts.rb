class CreateAttempts < ActiveRecord::Migration
  def change
    create_table :attempts do |t|
      t.integer :word_id
      t.string :ip_address
      t.string :attempt
      t.timestamps
    end
  end
end

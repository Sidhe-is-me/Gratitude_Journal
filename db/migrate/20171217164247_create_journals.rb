class CreateJournals < ActiveRecord::Migration
  def change
    create_table :journals do |t|
      t.string :content
      t.date :Date
      t.string :content
      t.string :content_greatful
      t.string :content_today_great
      t.string :content_affirmation
      t.string :content_amazing
      t.string :content_better
      t.integer :user_id
    end
  end
end

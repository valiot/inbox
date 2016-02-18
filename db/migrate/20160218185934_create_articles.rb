class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :link
      t.integer :status, default: 0
      t.belongs_to :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

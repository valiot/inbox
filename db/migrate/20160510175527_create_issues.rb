class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.date :issued_at
      t.integer :guid

      t.timestamps null: false
    end
    add_belongs_to(:articles, :issue, index: true, foreign_key: true)
  end
end

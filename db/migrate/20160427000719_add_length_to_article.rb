class AddLengthToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :length, :integer
  end
end

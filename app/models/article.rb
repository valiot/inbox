class Article < ActiveRecord::Base
  belongs_to :category
  enum status: [:submited, :approved, :rejected]
end

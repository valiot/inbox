class Article < ActiveRecord::Base
  belongs_to :category
  enum status: [:submited, :approved, :rejected]

  before_create :parse_link

  def parse_link
    page = MetaInspector.new(link)
    self.description = page.description
    self.title = page.title
    self.length = page.body_length
    self.image = page.images.best
  end

  def reading_time
    (length / 150.0).ceil
  end
end

require 'open-uri'
class Article < ActiveRecord::Base
  belongs_to :category
  belongs_to :issue
  enum status: [:submited, :approved, :rejected]

  before_create :parse_link
  before_create :set_issue

  def reading_time
    (length / 150.0).ceil
  end

  private

  def crop_image_and_upload_to_s3(url)
    image = MiniMagick::Image.open(url)
    image.resize "360x240"
    image

    uri = URI.parse(url)
    filename, extension = uri.path.split('/')[-1].split('.')[-2..-1]
    service = S3::Service.new(access_key_id: ENV['AWS_KEY'],
                              secret_access_key: ENV['AWS_SECRET'])

    bucket = service.buckets.find(ENV['S3_BUCKET'])
    new_object = bucket.objects.build("#{filename}-#{SecureRandom.hex}.#{extension}")
    new_object.content = open(image.path)

    return new_object.url if new_object.save
    false
  end

  def parse_link
    page = MetaInspector.new(link)
    self.description = page.description
    self.title = page.title
    self.length = page.body_length
    self.image = crop_image_and_upload_to_s3(page.images.best)
  end

  def set_issue
    self.issue = Issue.current_issue
  end

end

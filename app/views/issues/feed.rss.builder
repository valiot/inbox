#encoding: UTF-8

xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Disrupting Newsletter"
    xml.author "Disruptive Angels"
    xml.description "Entrepreneurship, Technology, Startups"
    xml.link "inbox.disruptiveangels.com"
    xml.language "en"

    for article in @issue.articles
      xml.item do
        if article.title
          xml.title article.title
        else
          xml.title ""
        end
        xml.author "Disruptive Angels"
        xml.pubDate article.created_at.to_s(:rfc822)
        xml.link "inbox.disruptiveangels.com/issues/#{article.id}"
        xml.guid article.id
        xml.category article.category.name
        xml.media(:content, url: article.image.sub(/^https?\:\/\//, '').sub(/^www./,''), medium: 'image', type: 'image/*')
        xml.media(:image, url: article.image.sub(/^https?\:\/\//, '').sub(/^www./,''), medium: 'image', type: 'image/*')
        xml.image(url: article.image.sub(/^https?\:\/\//, '').sub(/^www./,''), medium: 'image', type: 'image/*')
        xml.description article.description
        # xml.tag!("reading_time") { xml.cdata!("article.reading_time") }
        xml.reading_time article.reading_time
      end
    end
  end
end

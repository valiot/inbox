#encoding: UTF-8
xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0", "xmlns:media" => "http://search.yahoo.com/mrss/" do
  xml.channel do
    xml.title "Disrupting Newsletter"
    xml.description "Entrepreneurship, Technology, Startups"
    xml.language "en"

    for article in @issue.articles
      xml.item do
        if article.title
          xml.title article.title
        else
          xml.title ""
        end
        xml.pubDate article.created_at.to_s(:rfc822)
        xml.link "http://inbox.disruptiveangels.com/issues/#{article.id}"
        xml.category article.category.name
        xml.media(:content, url: article.image.sub(/^https?\:\/\//, '').sub(/^www./,''), type:'image/*', medium:'image')
        xml.description article.description
        xml.image do
          xml.url article.image.sub(/^https?\:\/\//, '').sub(/^www./,'')
          xml.link article.image
          xml.medium 'image'
          xml.type 'image/*'
        end
        xml.readtime article.reading_time
      end
    end
  end
end

module MetaInspector
  class Document
    def body_length
      return primary_body unless primary_body.nil? || primary_body <= 0
      secondary_body
    end

    private

    def primary_body
      parsed.search('//article').to_a.map(&:text)
            .join(' ').split(' ').count
    end

    def secondary_body
      parsed.search('//p[string-length() >= 10]').to_a.map(&:text)
            .join(' ').split(' ').count
    end
  end
end

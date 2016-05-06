class NewsItem < ActiveRecord::Base
  require "nokogiri"
  require "open-uri"

  scope :ordered, -> { order("id DESC") }
  scope :recent, lambda { |limit_value| limit(limit_value) }

  def self.import
    begin
      doc = Nokogiri::HTML(open("http://www.krmelin.cz/"))
    rescue
      return "Can't open the URL"
    end

    if doc
      doc.css("#titulka #titulka_news .tit_news").reverse.each do |link|
        title = link.css(".tit_obsah")[0].content
        date = link.css(".tit_datum")[0].content
        link = link.css("a.not_readable")[0].attribute("href")

        unless NewsItem.where(imported_date: date, imported_title: title).any?
          news_item = NewsItem.new
          news_item.imported_title = title
          news_item.imported_date = date
          news_item.imported_link = link
          news_item.save
        end
      end
      return "Import Finished Successfully"
    end
  end
end

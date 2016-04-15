class NewsItemMailerPreview < ActionMailer::Preview
  def notify
    NewsItemMailer.notify(NewsItem.all, User.first)
  end
end

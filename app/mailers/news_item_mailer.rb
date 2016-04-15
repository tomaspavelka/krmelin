class NewsItemMailer < ApplicationMailer
  def notify(news_items, user)
    @user = user
    @news_items = news_items
    mail(to: @user.email, subject: "Aktuality Krmelín")
  end
end

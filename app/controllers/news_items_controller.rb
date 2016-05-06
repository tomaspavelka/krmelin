class NewsItemsController < ApplicationController
  def index
    @news_items = NewsItem.ordered.page(params[:page])
    @activity = Activity.recent.first
  end

  def import
    NewsItem.import

    news_items_for_notification = NewsItem.where(notified: false).ordered
    if news_items_for_notification.any?
      User.all.each do |user|
        NewsItemMailer.notify(news_items_for_notification, user).deliver_now
      end
      news_items_for_notification.update_all(notified: true)
    end

    activity = Activity.new
    activity.news_items_check = true
    activity.save

    render text: "Import Finished"
  end
end

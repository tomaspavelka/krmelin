class NewsItemsController < ApplicationController
  def index
    @news_items = NewsItem.ordered
    @activity = Activity.recent.first
    raise "Exception Notifier Test"
  end

  def import
    NewsItem.import
    render text: "Imported Successfully!!!"
  end
end

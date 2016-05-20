class UsersController < ApplicationController
  before_action :authenticate, only: [:index, :send_test_email]

  def index
    @users = User.all.order(:created_at)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "E-mail býl úspěšně přidán."
    else
      render :new
    end
  end

  def send_test_email
    @user = User.enabled_testing_emails.find(params[:id])
    if @user
      NewsItemMailer.notify(NewsItem.ordered.recent(5), @user).deliver_now
      flash[:notice] = "Testovací e-mail odeslán."
    end
    redirect_to :users
  end

  private

  def user_params
    params.require(:user).permit(:email)
  end
end

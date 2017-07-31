class NewsUpdatesController < ApplicationController
  before_action :authenticate_admin!
  before_action :find_news_update, only: [:edit, :update, :destroy]

  def index
    @news_updates = NewsUpdate.all 
  end

  def new
    @news_update = NewsUpdate.new 
  end

  def create
    @news_update = NewsUpdate.new(news_update_params)
    if @news_update.save
      redirect_to admin_news_path
    else
      @errors = @news_update.errors.full_messages
      render 'new'
    end
  end

  def edit
  end

  def update
    if @news_update.update(news_update_params)
      redirect_to admin_news_path
    else
      @errors = @news_update.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    @news_update.destroy

    redirect_to admin_news_path
  end

  private
    def news_update_params
      params.require(:news_update).permit(:title, :description, :date, :active, :image)
    end

    def find_news_update
      @news_update = NewsUpdate.find(params[:id])
    end

end
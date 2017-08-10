class ResultsController < ApplicationController
  before_action :authenticate_admin!
  before_action :find_result, only: [:edit, :update, :destroy]

  def index
    @results = Result.all
  end

  def new
    @result = Result.new
  end

  def create
    @result = Result.new(result_params)
    if @result.save
      redirect_to admin_results_path
    else
      @errors = @result.errors.full_messages
      render 'new'
    end
  end

  def edit
  end

  def update
    if @result.update(result_params)
      redirect_to admin_results_path
    else
      @errors = @result.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    @result.destroy

    redirect_to admin_results_path
  end

  private
    def result_params
      result_args = params.require(:result)
      result_args.merge!(year: Date::strptime(params[:result][:year], "%Y"))
      result_args.permit(:year, :level, :description, :image)
    end

    def find_result
      @result = Result.find(params[:id])
    end


end
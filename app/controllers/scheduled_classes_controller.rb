class ScheduledClassesController < ApplicationController
  before_action :authenticate_admin!
  before_action :find_scheduled_class, only: [:edit, :update, :destroy]

  def index
    @scheduled_classes = ScheduledClass.all
  end

  def new
    @scheduled_class = ScheduledClass.new
  end

  def create
    @scheduled_class = ScheduledClass.new(scheduled_class_params)
    if @scheduled_class.save
      redirect_to admin_schedule_path
    else
      @errors = @scheduled_class.errors.full_messages
      render 'new'
    end
  end

  def edit
  end

  def update
    if @scheduled_class.update(scheduled_class_params)
      redirect_to admin_schedule_path
    else
      @errors = @scheduled_class.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    @scheduled_class.destroy

    redirect_to admin_schedule_path
  end

  private
    def scheduled_class_params
      params.require(:scheduled_class).permit(:start_date, :end_date, :time, :name, :about, :instructor)
    end

    def find_scheduled_class
      @scheduled_class = ScheduledClass.find(params[:id])
    end

end
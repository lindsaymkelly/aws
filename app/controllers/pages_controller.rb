class PagesController < ApplicationController
  def index
    @news = NewsUpdate.active_news
  end

  def classes
    @descriptions = ClassDescription.all.group_by(&:classification)
  end

  def schedule
    # debugger 
    @classes = ScheduledClass.all 
    @classes = @classes.by_instructor(params[:instructor]) if params[:instructor].present? && params[:instructor] != "All Instructors"
    @classes = @classes.by_name(params[:name]) if params[:name].present? && params[:name] != "All Classes"
    @classes = @classes.active_classes(params[:date]) if params[:date].present?
    @classes = @classes.group_by(&:day)

  end

  def results
    @results = Result.all #should this be filtered at all?
  end

  def staff
    @staff = StaffMember.active_staff
  end

  def about
  end

  def location
  end

  def login
  end

end
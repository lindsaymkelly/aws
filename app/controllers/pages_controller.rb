class PagesController < ApplicationController
  def index
    @news = NewsUpdate.active_news
  end

  def classes
    @descriptions = ClassDescription.all.group_by(&:classification)
  end

  def schedule

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

end
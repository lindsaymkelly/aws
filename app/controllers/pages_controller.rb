class PagesController < ApplicationController
  def index
  end

  def classes
    @descriptions = ClassDescription.all.group_by(&:classification)
  end

  def schedule
  end

  def results
  end

  def staff
  end

  def about
  end

  def location
  end

end
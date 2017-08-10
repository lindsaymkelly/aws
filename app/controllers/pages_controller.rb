class PagesController < ApplicationController
  def index
    @news = NewsUpdate.active_news.order(date: :asc)
  end

  def classes
    @descriptions = ClassDescription.all.group_by(&:classification)
  end

  def schedule
    # if any filter parameters present, filter the collection
    if params[:instructor].present? || params[:name].present? || params[:date].present?
      @classes = ScheduledClass.all 
      @classes = @classes.by_instructor(params[:instructor]) if params[:instructor].present? && params[:instructor] != "All Instructors"
      @classes = @classes.by_name(params[:name]) if params[:name].present? && params[:name] != "All Classes"
      @classes = @classes.active_classes(params[:date]) if params[:date].present?
    # otherwise return only active classes based on current date
    else
      @classes = ScheduledClass.active_classes
    end

    # sort all classes by day of week and group them by that day
    @classes = @classes.sort { |a, b| ScheduledClass.days_of_week[a.day] <=> ScheduledClass.days_of_week[b.day] }.group_by(&:day)
    # debugger
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

  def sign_up
    @class = ScheduledClass.find(params[:format])
  end

  def send_sign_up
    @email_content = email_params
    unless @email_content[:parent].empty? || @email_content[:child].empty? 
      SignUpMailer.new_sign_up_email(@email_content).deliver_later
      redirect_to schedule_path, notice: 'Sign up complete! Please contact AWS with any additional questions.'
    else
      @errors = ["Please fill out the form to sign up for a class."]
      @class = ScheduledClass.find(@email_content[:klass][:id])
      render 'sign_up'
    end
  end

  private

    def email_params
      email_info = {
        klass: ScheduledClass.find(params["requested_class"]),
        parent: params["parent_name"],
        child: params["child_name"],
        email: params["email"],
        phone: params["phone"],
        notes: params["notes"] || ""
      }
    end

end
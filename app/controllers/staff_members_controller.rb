class StaffMembersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @staff_members = StaffMember.all
    @staff_member = StaffMember.new
  end

  def create
    staff_member = StaffMember.new(staff_member_params)
    if staff_member.save
      redirect_to admin_staff_path
    else
      @errors = staff_member.errors.full_messages
      render 'new'
    end
  end

  def update
  end

  def destroy
  end

  private
    def staff_member_params
      params.require(:staff_member).permit(:name, :bio, :image)
    end

end
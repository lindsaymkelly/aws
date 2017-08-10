class StaffMembersController < ApplicationController
  before_action :authenticate_admin!
  before_action :find_staff_member, only: [:edit, :update, :destroy]

  def index
    @staff_members = StaffMember.all
  end

  def new
    @staff_member = StaffMember.new
  end

  def create
    @staff_member = StaffMember.new(staff_member_params)

    if @staff_member.save
      redirect_to admin_staff_path
    else
      @errors = @staff_member.errors.full_messages
      render 'new'
    end
  end

  def edit
  end

  def update
    if @staff_member.update(staff_member_params)
      redirect_to admin_staff_path
    else
      @errors = @staff_member.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    @staff_member.destroy

    redirect_to admin_staff_path
  end

  private
    def staff_member_params
      params.require(:staff_member).permit(:name, :bio, :image, :active)
    end

    def find_staff_member
      @staff_member = StaffMember.find(params[:id])
    end

end
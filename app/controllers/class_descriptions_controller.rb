class ClassDescriptionsController < ApplicationController
  before_action :authenticate_admin!
  before_action :find_class_description, only: [:edit, :update, :destroy]

  def index
    @class_descriptions = ClassDescription.all
  end

  def new
    @class_description = ClassDescription.new
  end

  def create
    @class_description = ClassDescription.new(class_description_params)
    if @class_description.save
      redirect_to admin_classes_path
    else
      @errors = @class_description.errors.full_messages
      render 'new'
    end
  end

  def edit
  end

  def update
    if @class_description.update(class_description_params)
      redirect_to admin_classes_path
    else
      @errors = @class_description.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    @class_description.destroy

    redirect_to admin_classes_path
  end

  private
    def class_description_params
      params.require(:class_description).permit(:classification, :title, :description, :fees)
    end

    def find_class_description
      @class_description = ClassDescription.find(params[:id])
    end

end
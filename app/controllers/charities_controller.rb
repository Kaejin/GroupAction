class CharitiesController < ApplicationController

  before_action :set_charity, only: [:show, :edit, :update, :destroy]

  def index
    @charities = policy_scope(Charity).order(:updated_at)
    authorize @charities
  end

  def new
    @charity = Charity.new
    authorize @charity
  end

  def create
    @charity = Charity.create(charity_params)
    @charity.user = current_user
    @charity.amount_raised = @charity.total_raised
    authorize @charity

    if @charity.save
      redirect_to charity_path(@charity)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @charity.update(charity_params)
      redirect_to charity_path(@charity)
    else
      render :new
    end
  end


  private

  def charity_params
    params.require(:charity).permit(:name, :mission, :bio, :charity_number, photos: [])
  end

  def set_charity
    @charity = Charity.find(params[:id])
    authorize @charity
  end
end

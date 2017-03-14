class FundraisersController < ApplicationController
  before_action :set_fundraiser, only: [:show, :edit, :update]

  def index
    @fundraisers = Fundraiser.all
  end

  def new
    @fundraiser = Fundraiser.new
  end

  def create
    @fundraiser = Fundraiser.create(fundraiser_params)
    @fundraiser.user = current_user

    if @fundraiser.save
      redirect_to fundraiser_path(@fundraiser)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @fundraiser.update(fundraiser_params)
      redirect_to fundraiser_path(@fundraiser)
    else
      render :new
    end
  end

  def destroy
  end

  private

  def set_fundraiser
    @fundraiser = Fundraiser.find(params[:id])
  end

  def fundraiser_params
    params.require(:fundraiser).permit(:user_id, :title, :end_date)
  end
end

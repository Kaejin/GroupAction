class FundraisersController < ApplicationController
  before_action :set_fundraiser, only: [:show, :edit, :update]

  def index
    @fundraisers = policy_scope(Fundraiser).order(:updated_at)
    authorize @fundraisers
  end

  def new
    @fundraiser = Fundraiser.new
    authorize @fundraiser
  end

  def create
    @fundraiser = Fundraiser.create(fundraiser_params)
    @fundraiser.user = current_user
    authorize @fundraiser

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
    authorize @fundraiser
  end

  def fundraiser_params
    params.require(:fundraiser).permit(:user_id, :title, :end_date)
  end
end

class FundraiserUpdatesController < ApplicationController

  before_action :set_fundraiser
  before_action :set_fundraiser_update, only: [:show, :edit, :update, :destroy]

  def new
    @fundraiser_update = FundraiserUpdate.new
    @fundraiser_update.fundraiser = @fundraiser
    authorize @fundraiser_update
  end


  def show
    authorize @fundraiser_update
  end

  def create
    @fundraiser_update = FundraiserUpdate.create(fundraiser_update_params)
    @fundraiser_update.fundraiser = @fundraiser
    authorize @fundraiser_update

    if @fundraiser_update.save
      redirect_to fundraiser_path(@fundraiser)
    else
      render :new
    end
  end

  def edit
    authorize @fundraiser_update
  end

  def update
    authorize @fundraiser_update
      if @fundraiser_update.update(fundraiser_update_params)
        redirect_to fundraiser_path(@fundraiser)
      else
        render :new
      end
  end

  def destroy
    authorize @fundraiser_update
    @fundraiser_update.destroy
    redirect_to fundraiser_path(@fundraiser)
  end

    private

  def set_fundraiser
    @fundraiser = Fundraiser.find(params[:fundraiser_id])
  end

  def set_fundraiser_update
    @fundraiser_update = FundraiserUpdate.find(params[:id])
  end



  def fundraiser_update_params
    params.require(:fundraiser_update).permit(:title, :message, :link, photos: [])
  end
end

class OfflineDonationsController < ApplicationController
  before_action :set_fundraiser
  before_action :set_event
  before_action :set_offline_donation, only: [ :edit, :update, :destroy]

  def new
    @offline_donation = OfflineDonation.new
    authorize @offline_donation
  end

  def create
    @offline_donation = OfflineDonation.create(offline_donations_params)
    if @event.nil?
      @offline_donation.imageable = @fundraiser
    else
      @offline_donation.imageable = @event
    end

    authorize @offline_donation
    if @offline_donation.save
      redirect_to fundraiser_path(@fundraiser)
    else
      render :new
    end
  end

  def edit
    authorize @offline_donation
  end

  def update
    authorize @offline_donation
    if @offline_donation.update(offline_donations_params)
      redirect_to fundraiser_path(@fundraiser)
    else
      render :new
    end
  end

  def destroy
    authorize @offline_donation
    @offline_donation.destroy
    redirect_to fundraiser_path(@fundraiser)
  end


  private

  def set_offline_donation
    @offline_donation = OfflineDonation.find(params[:id])
  end

  def set_event
    @event = Event.find(params[:event_id]) unless params[:event_id].nil?
  end

  def set_fundraiser
    @fundraiser = Fundraiser.find(params[:fundraiser_id]) unless params[:fundraiser_id].nil?
  end


  def offline_donations_params
    params.require(:offline_donation).permit(:amount, :message)
  end

end

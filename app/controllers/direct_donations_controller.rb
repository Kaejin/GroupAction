class DirectDonationsController < ApplicationController

  before_action :set_direct_donation, only: [:show, :edit, :update]

  def index
    @direct_donations = policy_scope.(DirectDonation).order(:created_at)
  end

  def show
  end

  def new
    @direct_donation = DirectDonation.new
  end

  def create
    @direct_donation = DirectDonation.new(direct_donation_params)
    @direct_donation.user = current_user
    @direct_donation.fundraiser = Fundraiser.find(params[:fundraiser_id])
    authorize @direct_donation

    if @direct_donation.save
      redirect_to fundraiser_path(@direct_donation.fundraiser)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @direct_donation.update(direct_donation_params)
      redirect_to direct_donation_path(@direct_donation)
    else
      render :new
    end
  end

  private


  def set_direct_donation
    @direct_donation = DirectDonation.find(params[:id])
  end

  def direct_donation_params
    params.require(:direct_donation).permit(:amount)
  end


end

class DirectDonationsController < ApplicationController

  before_action :set_direct_donation, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:index, :show, :new, :create]

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
    @direct_donation.user = user_signed_in? ? current_user : User.first
    @direct_donation.fundraiser = Fundraiser.find(params[:fundraiser_id])
    authorize @direct_donation

    if @direct_donation.save
      redirect_to fundraiser_path(@direct_donation.fundraiser)
    else
      render :new
    end
  end


  private


  def set_direct_donation
    @direct_donation = DirectDonation.find(params[:id])
  end

  def direct_donation_params
    params.require(:direct_donation).permit(:amount, :message)
  end


end

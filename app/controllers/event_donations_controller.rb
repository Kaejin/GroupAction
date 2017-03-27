class EventDonationsController < ApplicationController
  before_action :set_event_donation, only: [:show]
  before_action :authenticate_user!, except: [:index, :show, :new, :create]

  def new
    @event_donation = EventDonation.new
    authorize @event_donation
  end

  def create
    @event_donation = EventDonation.create(event_donation_params)
    @event_donation.user = current_user if user_signed_in?
    @event_donation.user = User.find(1)
    @event_donation.event = Event.find(params[:event_id])
    authorize @event_donation

    if @event_donation.save
      redirect_to fundraiser_event_path(@event_donation.event.fundraiser, @event_donation.event)
    else
      render :new
    end
  end

  def show
    authorize @event_donation
  end

  private

  def set_event_donation
    @event_donation = EventDonation.find(params[:id])
  end

  def event_donation_params
    params.require(:event_donation).permit(:user_id, :event_id, :amount, :message)
  end
end

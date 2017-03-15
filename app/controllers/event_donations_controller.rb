class EventDonationsController < ApplicationController
  before_action :set_event_donation, only: [:show]

  def new
    @event_donation = EventDonation.new
    authorize @event_donation
  end

  def create
    @event_donation = EventDonation.create(event_donation_params)
    @event_donation.user = current_user
    # @event_donation.event = Need to get event
    authorize @event_donation

    if @event_donation.save
      redirect_to event_donation_path(@event_donation)
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
    params.require(:event_donation).permit(:user_id, :event_id, :amount)
  end
end

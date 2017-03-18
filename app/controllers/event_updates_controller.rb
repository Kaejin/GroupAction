class EventUpdatesController < ApplicationController
  before_action :set_fundraiser
  before_action :set_event
  before_action :set_event_update, only: [:show, :edit, :update, :destroy]

  def new
    @event_update = EventUpdate.new
    @event_update.event = @event
    authorize @event_update
  end

  def show
  end

  def create
    @event_update = EventUpdate.create(event_update_params)
    @event_update.event = @event
    authorize @event_update

    if @event_update.save
      redirect_to fundraiser_event_path(@fundraiser, @event)
    else
      render :new
    end
  end

  def edit
    authorize @event_update
  end

  def update
    authorize @event_update
      if @event_update.update(event_update_params)
        redirect_to fundraiser_event_path(@fundraiser, @event)
      else
        render :new
      end
  end

  def destroy
    authorize @event_update
    @event_update.destroy
    redirect_to fundraiser_event_path(@fundraiser, @event)
  end

    private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_fundraiser
    @fundraiser = Fundraiser.find(params[:fundraiser_id])
  end

  def set_event_update
    @event_update = EventUpdate.find(params[:id])
  end

  def event_update_params
    params.require(:event_update).permit(:title, :message)
  end
end

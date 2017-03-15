class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update]
  before_action :set_fundraiser, only: [:new, :create, :show]

  def index
    @events = policy_scope(Event).order(:updated_at)
    authorize @events
  end

  def new
    @event = Event.new
    authorize @event
  end

  def create
    @event = Event.create(event_params)
    authorize @event

    @event.user = current_user
    @event.fundraiser = @fundraiser

    if @event.save
      redirect_to fundraiser_event_path(@fundraiser, @event)
    else
      render :new
    end
  end

  def show
    authorize @event
  end

  def edit
    authorize @event
  end

  def update
    authorize @event
    if @event.update(event_params)
      redirect_to fundraiser_event_path(@fundraiser, @event)
    else
      render :new
    end
  end

  def destroy
  end

  private

  def set_fundraiser
    @fundraiser = Fundraiser.find(params[:fundraiser_id])
  end


  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:user_id, :fundraiser_id, :title, :start_date)
  end
end

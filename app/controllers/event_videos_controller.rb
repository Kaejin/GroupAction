class EventVideosController < ApplicationController
  before_action :set_fundraiser
  before_action :set_event
  before_action :set_event_video, only: [:edit, :update, :destroy]

  def new
    @event_video = EventVideo.new
    @event_video.event = @event
    authorize @event_video
  end

  def create
    @event_video = EventVideo.create(event_video_params)
    @event_video.event = @event
    authorize @event_video

    if @event_video.save
      redirect_to fundraiser_event_path(@fundraiser, @event)
    else
      render :new
    end
  end

  def edit
    authorize @event_video
  end

  def update
    authorize @event_video
      if @event_video.update(event_video_params)
        redirect_to fundraiser_event_path(@fundraiser, @event)
      else
        render :new
      end
  end

  def destroy
    authorize @event_video
    @event_video.destroy
    redirect_to fundraiser_event_path(@fundraiser, @event)
  end

    private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_fundraiser
    @fundraiser = Fundraiser.find(params[:fundraiser_id])
  end

  def set_event_video
    @event_video = EventVideo.find(params[:id])
  end

  def event_video_params
    params.require(:event_video).permit(:title, :link)
  end
end

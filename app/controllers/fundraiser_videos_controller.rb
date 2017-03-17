class FundraiserVideosController < ApplicationController

  before_action :set_fundraiser
  before_action :set_fundraiser_video, only: [:edit, :update, :destroy]

  def new
    @fundraiser_video = FundraiserVideo.new
    authorize @fundraiser
  end

  def create
    @fundraiser_video = FundraiserVideo.create(fundraiser_video_params)
    authorize @fundraiser
    @fundraiser_video.fundraiser = @fundraiser

    if @fundraiser_video.save
      redirect_to fundraiser_path(@fundraiser)
    else
      render :new
    end
  end

  def edit
    authorize @fundraiser
  end

  def update
    authroize @fundraiser
      if @fundraiser_video.save
        redirect_to fundraiser_path(@fundraiser)
      else
        render :new
      end
  end

  def destroy
    authorize @fundraiser
    @fundraiser_video.destroy
    redirect_to fundraiser_path(@fundraiser)
  end

    private

  def set_fundraiser
    @fundraiser = Fundraiser.find(params[:fundraiser_id])
  end

  def set_fundraiser_video
    @fundraiser_video = FundraiserVideo.find(params[:id])
  end



  def fundraiser_video_params
    params.require(:fundraiser_video).permit(:title, :link)
  end
end

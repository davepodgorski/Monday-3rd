class PicturesController < ApplicationController
  before_action :ensure_logged_in, except :[:index, :show]
  before_action :load_picture, only: [:show, :edit, :update, :destroy]

  def new
      @picture = Picture.new
    end

  def load_picture
    @picture = Picture.find(params[:id])
  end

  def create
    @picture = Picture.new

    @picture.title = params[:picture][:title]
    @picture.artist = params[:picture][:artist]
    @picture.url = params[:picture][:url]


      if @picture.save
    # if the picture gets saved, generate a get request to "/pictures" (the index)
        redirect_to "/pictures"
      else
    # otherwise render new.html.erb
        render :new
      end
    end

  def index
        @most_recent_pictures = Picture.most_recent_five
        @pictures = Picture.where("created_at > ?", Time.now - 1.month)
  end
  def show
    @picture = Picture.find(params[:id])
  end
  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])

    @picture.title = params[:picture][:title]
    @picture.artist = params[:picture][:artist]
    @picture.url = params[:picture][:url]


    if @picture.save
      redirect_to "/pictures/#{@picture.id}"
    else
      render :edit
    end
  end
  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to "/pictures"
  end

  def ensure_user_owns_picture
    unless current_user == @picture.user
      flash[:alert] = "Please log in"
      redirect_to new_session_url
    end


end

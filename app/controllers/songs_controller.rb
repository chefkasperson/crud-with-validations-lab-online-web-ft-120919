class SongsController < ApplicationController
  before_action :set_song, only: [:new]
  before_action :set_songs, only: [:index]
  before_action :set_song_from_id, only: [:show, :edit, :update, :destroy]

  def new
  end

  def create
    @song = Song.new(song_params)
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def index
  end

  def show
  end

  def edit
  end

  def update
    if @song.update(song_params)
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
    @song.destroy
    redirect_to songs_url
  end

  private

  def set_song
    @song = Song.new
  end

  def set_songs
    @songs = Song.all
  end

  def set_song_from_id
    @song = Song.find_by(id: params[:id])
  end

  def song_params
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
  end
end

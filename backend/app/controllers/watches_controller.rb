class WatchesController < ApplicationController
  before_action :set_watch, only: %i[ show update destroy ]
  before_action :authorized

  # GET /watches
  def index
    @watches = Watch.find_by user: @user.id

    render json: @watches
  end

  # GET /watches/1
  def show
    render json: @watch
  end

  # POST /watches
  def create
    @watch = Watch.new(watch_params)
    @watch.user = @user.id

    if @watch.save
      render json: @watch, status: :created, location: @watch
    else
      render json: @watch.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /watches/1
  def update
    if @watch.update(watch_params)
      render json: @watch
    else
      render json: @watch.errors, status: :unprocessable_entity
    end
  end

  # DELETE /watches/1
  def destroy
    @watch.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_watch
      @watch = Watch.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def watch_params
      params.require(:watch).permit(:user_id, :name, :model, :price, :images, :movement)
    end
end

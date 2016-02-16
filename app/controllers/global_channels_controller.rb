class GlobalChannelsController < ApplicationController
  before_action :set_global_channel, only: [:show, :edit, :update, :destroy]

  # GET /global_channels
  # GET /global_channels.json
  def index
    @global_channels = GlobalChannel.all
  end

  # GET /global_channels/1
  # GET /global_channels/1.json
  def show
  end

  # GET /global_channels/new
  def new
    @global_channel = GlobalChannel.new
  end

  # GET /global_channels/1/edit
  def edit
  end

  # POST /global_channels
  # POST /global_channels.json
  def create
    @global_channel = GlobalChannel.new(global_channel_params)

    respond_to do |format|
      if @global_channel.save
        format.html { redirect_to @global_channel, notice: 'Global channel was successfully created.' }
        format.json { render :show, status: :created, location: @global_channel }
      else
        format.html { render :new }
        format.json { render json: @global_channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /global_channels/1
  # PATCH/PUT /global_channels/1.json
  def update
    respond_to do |format|
      if @global_channel.update(global_channel_params)
        format.html { redirect_to @global_channel, notice: 'Global channel was successfully updated.' }
        format.json { render :show, status: :ok, location: @global_channel }
      else
        format.html { render :edit }
        format.json { render json: @global_channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /global_channels/1
  # DELETE /global_channels/1.json
  def destroy
    @global_channel.destroy
    respond_to do |format|
      format.html { redirect_to global_channels_url, notice: 'Global channel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_global_channel
      @global_channel = GlobalChannel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def global_channel_params
      params.require(:global_channel).permit(:message)
    end
end

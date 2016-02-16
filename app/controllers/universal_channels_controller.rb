class UniversalChannelsController < ApplicationController
  before_action :set_universal_channel, only: [:show, :edit, :update, :destroy]

  # GET /universal_channels
  # GET /universal_channels.json
  def index
    @universal_channels = UniversalChannel.all
  end

  # GET /universal_channels/1
  # GET /universal_channels/1.json
  def show
  end

  # GET /universal_channels/new
  def new
    @universal_channel = UniversalChannel.new
  end

  # GET /universal_channels/1/edit
  def edit
  end

  # POST /universal_channels
  # POST /universal_channels.json
  def create
    @universal_channel = UniversalChannel.new(universal_channel_params)

    respond_to do |format|
      if @universal_channel.save
        format.html { redirect_to @universal_channel, notice: 'Universal channel was successfully created.' }
        format.json { render :show, status: :created, location: @universal_channel }
      else
        format.html { render :new }
        format.json { render json: @universal_channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /universal_channels/1
  # PATCH/PUT /universal_channels/1.json
  def update
    respond_to do |format|
      if @universal_channel.update(universal_channel_params)
        format.html { redirect_to @universal_channel, notice: 'Universal channel was successfully updated.' }
        format.json { render :show, status: :ok, location: @universal_channel }
      else
        format.html { render :edit }
        format.json { render json: @universal_channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /universal_channels/1
  # DELETE /universal_channels/1.json
  def destroy
    @universal_channel.destroy
    respond_to do |format|
      format.html { redirect_to universal_channels_url, notice: 'Universal channel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_universal_channel
      @universal_channel = UniversalChannel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def universal_channel_params
      params.require(:universal_channel).permit(:message)
    end
end

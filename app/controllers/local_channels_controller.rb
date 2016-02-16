class LocalChannelsController < ApplicationController
  before_action :set_local_channel, only: [:show, :edit, :update, :destroy]

  # GET /local_channels
  # GET /local_channels.json
  def index
    @local_channels = LocalChannel.all
  end

  # GET /local_channels/1
  # GET /local_channels/1.json
  def show
  end

  # GET /local_channels/new
  def new
    @local_channel = LocalChannel.new
  end

  # GET /local_channels/1/edit
  def edit
  end

  # POST /local_channels
  # POST /local_channels.json
  def create
    @local_channel = LocalChannel.new(local_channel_params)

    respond_to do |format|
      if @local_channel.save
        format.html { redirect_to @local_channel, notice: 'Local channel was successfully created.' }
        format.json { render :show, status: :created, location: @local_channel }
      else
        format.html { render :new }
        format.json { render json: @local_channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /local_channels/1
  # PATCH/PUT /local_channels/1.json
  def update
    respond_to do |format|
      if @local_channel.update(local_channel_params)
        format.html { redirect_to @local_channel, notice: 'Local channel was successfully updated.' }
        format.json { render :show, status: :ok, location: @local_channel }
      else
        format.html { render :edit }
        format.json { render json: @local_channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /local_channels/1
  # DELETE /local_channels/1.json
  def destroy
    @local_channel.destroy
    respond_to do |format|
      format.html { redirect_to local_channels_url, notice: 'Local channel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_local_channel
      @local_channel = LocalChannel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def local_channel_params
      params.require(:local_channel).permit(:message)
    end
end

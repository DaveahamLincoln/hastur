require 'test_helper'

class LocalChannelsControllerTest < ActionController::TestCase
  setup do
    @local_channel = local_channels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:local_channels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create local_channel" do
    assert_difference('LocalChannel.count') do
      post :create, local_channel: { message: @local_channel.message }
    end

    assert_redirected_to local_channel_path(assigns(:local_channel))
  end

  test "should show local_channel" do
    get :show, id: @local_channel
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @local_channel
    assert_response :success
  end

  test "should update local_channel" do
    patch :update, id: @local_channel, local_channel: { message: @local_channel.message }
    assert_redirected_to local_channel_path(assigns(:local_channel))
  end

  test "should destroy local_channel" do
    assert_difference('LocalChannel.count', -1) do
      delete :destroy, id: @local_channel
    end

    assert_redirected_to local_channels_path
  end
end

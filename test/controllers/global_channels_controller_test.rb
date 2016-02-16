require 'test_helper'

class GlobalChannelsControllerTest < ActionController::TestCase
  setup do
    @global_channel = global_channels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:global_channels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create global_channel" do
    assert_difference('GlobalChannel.count') do
      post :create, global_channel: { message: @global_channel.message }
    end

    assert_redirected_to global_channel_path(assigns(:global_channel))
  end

  test "should show global_channel" do
    get :show, id: @global_channel
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @global_channel
    assert_response :success
  end

  test "should update global_channel" do
    patch :update, id: @global_channel, global_channel: { message: @global_channel.message }
    assert_redirected_to global_channel_path(assigns(:global_channel))
  end

  test "should destroy global_channel" do
    assert_difference('GlobalChannel.count', -1) do
      delete :destroy, id: @global_channel
    end

    assert_redirected_to global_channels_path
  end
end

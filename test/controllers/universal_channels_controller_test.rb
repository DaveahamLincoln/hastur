require 'test_helper'

class UniversalChannelsControllerTest < ActionController::TestCase
  setup do
    @universal_channel = universal_channels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:universal_channels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create universal_channel" do
    assert_difference('UniversalChannel.count') do
      post :create, universal_channel: { message: @universal_channel.message }
    end

    assert_redirected_to universal_channel_path(assigns(:universal_channel))
  end

  test "should show universal_channel" do
    get :show, id: @universal_channel
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @universal_channel
    assert_response :success
  end

  test "should update universal_channel" do
    patch :update, id: @universal_channel, universal_channel: { message: @universal_channel.message }
    assert_redirected_to universal_channel_path(assigns(:universal_channel))
  end

  test "should destroy universal_channel" do
    assert_difference('UniversalChannel.count', -1) do
      delete :destroy, id: @universal_channel
    end

    assert_redirected_to universal_channels_path
  end
end

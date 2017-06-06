require 'test_helper'

class MessageThreadsControllerTest < ActionController::TestCase
  setup do
    @message_thread = message_threads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:message_threads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create message_thread" do
    assert_difference('MessageThread.count') do
      post :create, message_thread: { owner_id: @message_thread.owner_id, sender_id: @message_thread.sender_id }
    end

    assert_redirected_to message_thread_path(assigns(:message_thread))
  end

  test "should show message_thread" do
    get :show, id: @message_thread
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @message_thread
    assert_response :success
  end

  test "should update message_thread" do
    patch :update, id: @message_thread, message_thread: { owner_id: @message_thread.owner_id, sender_id: @message_thread.sender_id }
    assert_redirected_to message_thread_path(assigns(:message_thread))
  end

  test "should destroy message_thread" do
    assert_difference('MessageThread.count', -1) do
      delete :destroy, id: @message_thread
    end

    assert_redirected_to message_threads_path
  end
end

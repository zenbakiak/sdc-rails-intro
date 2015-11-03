require 'test_helper'

class GagsControllerTest < ActionController::TestCase
  setup do
    @gag = gags(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gag" do
    assert_difference('Gag.count') do
      post :create, gag: { author_id: @gag.author_id, comments_count: @gag.comments_count, media_file: @gag.media_file, title: @gag.title, votes_count: @gag.votes_count }
    end

    assert_redirected_to gag_path(assigns(:gag))
  end

  test "should show gag" do
    get :show, id: @gag
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gag
    assert_response :success
  end

  test "should update gag" do
    patch :update, id: @gag, gag: { author_id: @gag.author_id, comments_count: @gag.comments_count, media_file: @gag.media_file, title: @gag.title, votes_count: @gag.votes_count }
    assert_redirected_to gag_path(assigns(:gag))
  end

  test "should destroy gag" do
    assert_difference('Gag.count', -1) do
      delete :destroy, id: @gag
    end

    assert_redirected_to gags_path
  end
end

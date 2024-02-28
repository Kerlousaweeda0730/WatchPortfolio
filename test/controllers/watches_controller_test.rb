require "test_helper"

class WatchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @watch = watches(:one)
  end

  test "should get index" do
    get watches_url, as: :json
    assert_response :success
  end

  test "should create watch" do
    assert_difference("Watch.count") do
      post watches_url, params: { watch: { images: @watch.images, model: @watch.model, movement: @watch.movement, name: @watch.name, price: @watch.price, user_id: @watch.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show watch" do
    get watch_url(@watch), as: :json
    assert_response :success
  end

  test "should update watch" do
    patch watch_url(@watch), params: { watch: { images: @watch.images, model: @watch.model, movement: @watch.movement, name: @watch.name, price: @watch.price, user_id: @watch.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy watch" do
    assert_difference("Watch.count", -1) do
      delete watch_url(@watch), as: :json
    end

    assert_response :no_content
  end
end

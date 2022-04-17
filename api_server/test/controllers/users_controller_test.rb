require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  teardown do
    Rails.cache.clear
  end

  test "created user is in a database" do
    post "/api/signup",
      params: { username: "test@test.com", password: "sample" }
    assert_response :created
    token = JSON.parse(response.body)["token"]

    get "/api/user",
      headers: { "Authorization": "Bearer #{token}" }
      username = JSON.parse(response.body)['username']
    assert_equal "test@test.com", username
  end

  test "created user can be logged in" do
    post "/api/login", 
      params: { username: "alice@test.com", password: "test" }
    assert_response :ok
    token = JSON.parse(response.body)["token"]

    get "/api/user",
      headers: { "Authorization": "Bearer #{token}" }
      username = JSON.parse(response.body)['username']
    assert_equal "alice@test.com", username
  end
end

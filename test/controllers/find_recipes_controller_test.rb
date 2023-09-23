require "test_helper"

class FindRecipesControllerTest < ActionDispatch::IntegrationTest
  # test "should get show" do
  #   get find_recipes_show_url
  #   assert_response :success
  # end

  test "should get root" do
    get root_path
    assert_response :success
  end

end

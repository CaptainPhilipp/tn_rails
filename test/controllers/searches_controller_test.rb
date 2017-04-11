require 'test_helper'

class SearchesControllerTest < ActionDispatch::IntegrationTest
  test "should get trains_by_terminal_stations" do
    get searches_trains_by_terminal_stations_url
    assert_response :success
  end

end

require 'test_helper'

class V1::TimelineItemsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get v1_timeline_url,
                headers: {
                  'Content-Type': 'application/vnd.api+json',
                        'Accept': 'application/vnd.api+json'
                }

    json = JSON.parse @response.body

    assert_response :ok
    assert          json['data']
    assert_equal    json['data'].class, Array
  end

  test 'should not respond to invalid `Accept` value' do
    get v1_timeline_url, headers: { 'Accept': 'text/html' }

    json = JSON.parse @response.body

    assert_response :not_acceptable
    assert          json['errors']
    assert          json['errors'][0]['title'], 'Not acceptable'
  end
end

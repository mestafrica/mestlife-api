require 'test_helper'

class V1::TextTimelineItemsControllerTest < ActionDispatch::IntegrationTest
  test "should create a text timeline item" do
    post v1_text_timeline_items_url,
      headers: request_headers,
           as: :json,
       params: {
         "data": {
           "type": "text-timeline-items",
           "attributes": {
             "text": "Obuasi, we have arrived o/"
           }
         }
       }

    assert_response :created

    id = JSON.parse(@response.body)["data"]["id"]
    assert_match @response.location, "#{v1_text_timeline_items_url}/#{id}"
  end

  test "should not create text timeline item without text" do
    post v1_text_timeline_items_url,
      headers: request_headers,
           as: :json,
       params: {
         "data": {
           "type": "text-timeline-items",
           "attributes": {
             "text": ""
           }
         }
       }

    assert_response :unprocessable_entity
  end
end

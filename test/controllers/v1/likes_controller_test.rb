require 'test_helper'

class V1::LikesControllerTest < ActionDispatch::IntegrationTest
  test "should not like without a reactionable" do
    post v1_likes_url,
         headers: request_headers,
              as: :json,
          params: {
            "data": {
              "type": "likes",
              "attributes": {},
              "relationships": {
                "reactionable": {}
              }
            }
          }

    assert_response :unprocessable_entity

    json = JSON.parse @response.body
    assert json["errors"]
  end

  test "should like a reactionable" do
    r = timeline_items(:one)

    post v1_likes_url,
         headers: request_headers,
              as: :json,
          params: {
            "data": {
              "type": "likes",
              "attributes": {},
              "relationships": {
                "reactionable": {
                  "data": { "type": "timeline-items", "id": r.id }
                }
              }
            }
          }

    assert_response :created

    id = JSON.parse(@response.body)["data"]["id"]

    assert_match @response.location, "#{v1_likes_url}/#{id}"
  end
end

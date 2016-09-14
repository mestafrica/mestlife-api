require "test_helper"

class V1::CommentsControllerTest < ActionDispatch::IntegrationTest
  test "create comment for a reactionable" do
    r = timeline_items(:one)

    post v1_comments_url,
         headers: request_headers,
              as: :json,
          params: {
            "data": {
              "type": "comments",
              "attributes": {
                "content": "Kumasi, we have arrived o/"
              },
              "relationships": {
                "reactionable": {
                  "data": { "type": "timeline-items", "id": r.id }
                }
              }
            }
          }

    assert_response :created

    id = JSON.parse(@response.body)["data"]["id"]

    assert_match @response.location, "#{v1_comments_url}/#{id}}"
  end

  test "should not create comment without content" do
    r = text_timeline_items(:one)  # A reactionable

    post v1_comments_url,
         headers: request_headers,
              as: :json,
          params: {
            "data": {
              "type": "comments",
              "attributes": {
                "content": ""
              },
              "relationships": {
                "reactionable": {
                  "data": { "type": "timeline-items", "id": r.id }
                }
              }
            }
          }

    assert_response :unprocessable_entity

    json = JSON.parse @response.body
    assert json['errors']
  end
end

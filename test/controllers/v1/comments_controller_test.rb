require "test_helper"

class V1::CommentsControllerTest < ActionDispatch::IntegrationTest
  test "create comment for a reactionable" do
    # TODO: Something wrong with either MiniTest
    # or fixtures is causing this test to fail. Instead of fetching
    # and returning fixture with key `:one`, it looks like it finds it
    # but changes the id all the time. Not good :(
    r = text_timeline_items(:one)

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
                "reactionable": { "type": "text-timeline-items", "id": r.id }
              }
            }
          }

    json = JSON.parse @response.body
    puts json.inspect
    assert_response :created
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
                "reactionable": { "type": "text-timeline-items", "id": r.id }
              }
            }
          }

    puts @response.body
    assert_response :unprocessable_entity
  end
end

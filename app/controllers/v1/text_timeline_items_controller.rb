class V1::TextTimelineItemsController < ApplicationController
  def destroy
    # We soft delete only.
    record = TextTimelineItem.find_by id: params[:id]
    head record.archive ? :no_content : :bad_request
  end
end

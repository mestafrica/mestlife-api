class V1::TextTimelineItemsController < ApplicationController
  def destroy
    # We soft delete only.
    record = TextTimelineItem.find_by id: params[:id]
    if record.archive
      head :no_content
    else
      head :bad_request
    end
  end
end

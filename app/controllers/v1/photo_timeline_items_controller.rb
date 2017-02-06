class V1::PhotoTimelineItemsController < ApplicationController
  def destroy
    # Soft delete only
    record = PhotoTimelineItem.find_by id: params[:id]
    head record.archive ? :no_content : :bad_request
  end
end

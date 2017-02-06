class V1::TimelineItemsController < ApplicationController
  def pinned
    @pinned = TimelineItem.
                unscoped.
                where.not(pinned_at: nil).
                order('pinned_at DESC')
    render text: @pinned.inspect
  end
end

class TimeBroadcastJob < ApplicationJob
  queue_as :default

  def perform
    current_time = Time.current.strftime("%-I:%M:%S")
    Turbo::StreamsChannel.broadcast_replace_to(
      :time,
      target: "time",
      html: "<a href='#' id='time' class='nav-link'>#{current_time}</a>"
    )
  end
end

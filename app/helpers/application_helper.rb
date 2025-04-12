module ApplicationHelper
  def render_flash_message_to_turbo_stream
    turbo_stream.prepend 'flash', partial: 'layouts/flash'
  end
end
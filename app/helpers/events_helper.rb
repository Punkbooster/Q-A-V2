module EventsHelper
  def status_label(status)
		status_span_generator(status)			
	end

	private
		def status_span_generator(status)
			case status
			when 'not started'
				content_tag(:span, status.titleize, class: 'badge badge-info')
			when 'live'
				content_tag(:span, status.titleize, class: 'badge badge-success')
			when 'finished'
				content_tag(:span, status.titleize, class: 'badge badge-secondary')
			when 'ERROR'
				content_tag(:span, status.titleize, class: 'badge badge-danger')
			end
  end
end
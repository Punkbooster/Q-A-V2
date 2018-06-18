module EventsHelper
  def status_label(status)
		status_span_generator(status)			
	end

	private
		def status_span_generator(status)
			case status
			when 'not started'
				content_tag(:span, status.titleize, class: 'badge badge-warning')
			when 'active'
				content_tag(:span, status.titleize, class: 'badge badge-success')
			when 'finished'
				content_tag(:span, status.titleize, class: 'badge badge-secondary')
			end
  end
end
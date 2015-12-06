module RespuestaHelper
 def toggle_opinion_button(respuesta, user)
	if user.flagged?(respuesta, :opinion)
		link_to "-1", like_respuestum_path(respuesta), :class => "ba2"
	else
		link_to "+1", like_respuestum_path(respuesta), :class => "ba2"
	end
 end
end

module SitesHelper
 def tipositio(site)
 	tipo = case site.tipositio
	 	when 2 then "Ciudad"
	 	when 3 then "Rural"
	 	when 4 then "Playa"
 	end

	return tipo
 end

 def tipositio(tipo)
 	tipo = case tipo.to_s
	 	when 2 then "urbanas"
	 	when 3 then "rurales"
	 	when 4 then "de playa"
	end 

	return tipo
 end

 def toggle_heestado_button(site, user)
	if user.flagged?(site, :estado)
		link_to "No conozco este sitio", like_site_path(site), :class => "ba2"
	else
		link_to "Conozco este sitio", like_site_path(site), :class => "ba2"
	end
 end
end

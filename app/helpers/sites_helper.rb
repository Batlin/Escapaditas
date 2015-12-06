module SitesHelper
 def tipositio(site)
	if site.tipositio==2
	tipo = "Ciudad"
	end
	if site.tipositio==3
	tipo = "Rural"
	end 
	if site.tipositio==4
	tipo = "Playa"
	end 
	return tipo
 end
 def tipositio(tipo)
	if tipo.to_s==2.to_s
	tipo = "urbanas"
	end
	if tipo.to_s==3.to_s
	tipo = "rurales"
	end 
	if tipo.to_s==4.to_s
	tipo = "de playa"
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

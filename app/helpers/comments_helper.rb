module CommentsHelper

 def tipocomentario(comment)
 	tipo = case comment.tipocomentario
	 	when 2 then "Sitios que hay que ver"
	 	when 3 then "Monumentos"
	 	when 4 then "Museos"
	 	when 5 then "Hoteles"
	 	when 6 then "Casas rurales"
	 	when 7 then "Sitios donde comer"
	 	when 8 then "De compras"
	 	when 9 then "Parques"
	 	when 10 then "Transporte"
	end

	return tipo
end
 def tipocomentarioconid(id)
 	tipo = case id.to_s
	 	when 2 then "Sitios que hay que ver"
	 	when 3 then "Monumentos"
	 	when 4 then "Museos"
	 	when 5 then "Hoteles"
	 	when 6 then "Casas rurales"
	 	when 7 then "Sitios donde comer"
	 	when 8 then "De compras"
	 	when 9 then "Parques"
	 	when 10 then "Transporte" 		
	end 
	return tipo
end

 def getestacion(comment)
 	tipo = case comment.estacion
	 	when 1 then "Cualquier epoca"
		when 2 then "Primavera"
		when 3 then "Verano"
		when 4 then "Otono"
		when 5 then "Invierno"
	end

	return tipo
end

end

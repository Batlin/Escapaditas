module CommentsHelper

 def tipocomentario(comment)
	if comment.tipocomentario==2
	tipo = "Sitios que hay que ver"
	end
	if comment.tipocomentario==3
	tipo = "Monumentos"
	end 
	if comment.tipocomentario==4
	tipo = "Museos"
	end 
	if comment.tipocomentario==5
	tipo = "Hoteles"
	end 
	if comment.tipocomentario==6
	tipo = "Casas rurales"
	end 
	if comment.tipocomentario==7
	tipo = "Sitios donde comer"
	end 
	if comment.tipocomentario==8
	tipo = "De compras"
	end 
	if comment.tipocomentario==9
	tipo = "Parques"
	end 
	if comment.tipocomentario==10
	tipo = "Transporte"
	end 
	return tipo
end
 def tipocomentarioconid(id)
	if id.to_s==2.to_s
	tipo = "Sitios que hay que ver"
	end
	if id.to_s==3.to_s
	tipo = "Monumentos"
	end 
	if id.to_s==4.to_s
	tipo = "Museos"
	end 
	if id.to_s==5.to_s
	tipo = "Hoteles"
	end 
	if id.to_s==6.to_s
	tipo = "Casas rurales"
	end 
	if id.to_s==7.to_s
	tipo = "Sitios donde comer"
	end 
	if id.to_s==8.to_s
	tipo = "De compras"
	end 
	if id.to_s==9.to_s
	tipo = "Parques"
	end 
	if id.to_s==10.to_s
	tipo = "Transporte"
	end 
	return tipo
end

 def getestacion(comment)
	if comment.estacion==1
	tipo = "Cualquier epoca del ano"
	end
	if comment.estacion==2
	tipo = "Primavera"
	end 
	if comment.estacion==3
	tipo = "Verano"
	end 
	if comment.estacion==4
	tipo = "Otono"
	end 
	if comment.estacion==5
	tipo = "Invierno"
	end 

	return tipo
end

end

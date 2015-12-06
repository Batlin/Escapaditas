class RespuestaController < ApplicationController

  before_filter :authenticate_user!, :except => [ :index, :show, :search]
  load_and_authorize_resource

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to(root_url, :notice => 'Permiso denegado.')
  end

  def like
	# Trata el tema de usuarios eliminados
	@respuesta = Respuestum.find(params[:id])  
	if User.find_by_id(@respuesta.user_id)
	@user = User.find(@respuesta.user_id)
	else
	@user = nil
	end
	if @current_user.flagged?(@respuesta, :opinion)
		@current_user.unflag(@respuesta, :opinion)
		if @user
		msg = "Has hecho -1 al comentario de " + @user.name
		baja_karma
		else		
		msg = "Has hecho -1 al comentario"
		end
	else
		@current_user.flag(@respuesta, :opinion)
		if @user
		msg = "Has hecho +1 al comentario de " + @user.name
		sube_karma
		else
		msg = "Has hecho +1 al comentario"
		end

	end
	redirect_to :back, :notice => msg
  end

  def sube_karma
    @user = User.find(@respuesta.user_id)
    @user.increment!(:karma)
  end

  def baja_karma
    @user = User.find(@respuesta.user_id)
    @user.decrement!(:karma)
  end

  # GET /respuesta
  # GET /respuesta.xml
  def index
   if params[:comment_id].nil?
    @respuesta = Respuestum.all
   else
    @respuesta = Respuestum.where(:comment_id => params[:comment_id])
    
end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @respuesta }
    end
  end

  # GET /respuesta/1
  # GET /respuesta/1.xml
  def show
    @respuestum = Respuestum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @respuestum }
    end
  end

  # GET /respuesta/new
  # GET /respuesta/new.xml
  def new
if params[:comment_id]

      @respuestum.comment_id = params[:comment_id]
@respuestum.user = current_user
else

@respuestum.user = current_user

end
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @respuestum }
    end
  end

  # GET /respuesta/1/edit
  def edit
    @respuestum = Respuestum.find(params[:id])
  end

  # POST /respuesta
  # POST /respuesta.xml
  def create
    @respuestum.user = current_user

    respond_to do |format|
      if @respuestum.save
        
        format.html { redirect_to(:back, :notice => 'Nueva respuesta creada.') }
        format.xml  { render :xml => @respuestum, :status => :created, :location => @respuestum }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @respuestum.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /respuesta/1
  # PUT /respuesta/1.xml
  def update

    respond_to do |format|
      if @respuestum.update_attributes(params[:respuestum])
        @redireccion = Comment.find(@respuestum.comment_id)
        format.html { redirect_to(@redireccion, :notice => 'Respuesta actualizada correctamente.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @respuestum.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /respuesta/1
  # DELETE /respuesta/1.xml
  def destroy
    @respuestum.destroy

    respond_to do |format|
      format.html { redirect_to(:back) }
      format.xml  { head :ok }
    end
  end
end

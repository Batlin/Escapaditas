class CommentsController < ApplicationController


  before_filter :authenticate_user!, :except => [ :index, :show, :search]
  load_and_authorize_resource

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to(root_url, :notice => 'Permiso denegado.')
  end

  # GET /comments
  # GET /comments.xml
  def index

   if params[:site_id].nil? or params[:site_id].empty? and params[:estacion].nil?
      @comments = Comment.all
      @comments_turisticos = Comment.where(:esturistico => 1)
      @titulo = "Sitios"
    elsif !params[:estacion].nil? 
      @comments = Comment.where(:estacion => params[:estacion])
      @comments_turisticos = Comment.where(:estacion => params[:estacion], :esturistico => 1)
      @titulo = "Sitios ideales para ver en esta estacion"   
    elsif params[:tipocomentario].nil? or params[:tipocomentario].empty?
      @comments = Comment.where(:site_id => params[:site_id])
      @comments_turisticos = Comment.where(:tipocomentario => params[:tipocomentario], :site_id => params[:site_id], :esturistico => 1)
      @localidad = Site.find(params[:site_id]).name
    else
      @comments = Comment.where(:tipocomentario => params[:tipocomentario], :site_id => params[:site_id])
      @comments_turisticos = Comment.where(:tipocomentario => params[:tipocomentario], :site_id => params[:site_id], :esturistico => 1)
      @localidad = Site.find(params[:site_id]).name
      @tipo = params[:tipocomentario]

   end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.xml
  def show
    @comment = Comment.find(params[:id])
    @user = User.find_by_id(@comment.user_id)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.xml
  # GET /sites/1/comments/new
  # GET /sites/1/comments/new.xml
  def new

   if params[:site_id] and params[:tipocomentario]
      @comment.site_id = params[:site_id]
      @comment.user = current_user
      @comment.tipocomentario = params[:tipocomentario]
   elsif params[:site_id]
      @comment.site_id = params[:site_id]
      @comment.user = current_user
    else
      @comment.user = current_user
   end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    
  end

  # POST /comments
  # POST /comments.xml
  def create
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to(@comment, :notice => 'Nuevo sitio creado.') }
        format.xml  { render :xml => @comment, :status => :created, :location => @comment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.xml
  def update

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to(@comment, :notice => 'Sitio actualizado correctamente.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.xml
  def destroy
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to(site_comments_path(@comment.site_id)) }
      format.xml  { head :ok }
    end
  end

 def subekarma
     @comment = current_user.comments.find(params[:id])
     User.find(@comment.user_id).update_attribute(:karma, User.find(@comment.user_id).karma+1)
 end
end

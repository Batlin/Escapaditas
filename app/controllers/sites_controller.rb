class SitesController < ApplicationController
  before_filter :authenticate_user!, :except => [ :index, :show, :search]
  load_and_authorize_resource

  after_filter :count_visit, :only => :show   
  after_filter :baja_karma, :only => :destroy

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to(root_url, :notice => 'Permiso denegado.')
  end

  def like
	@site = Site.find(params[:id])  
	if @current_user.flagged?(@site, :estado)
		@current_user.unflag(@site, :estado)
		msg = "No has estado aqui."
	else
		@current_user.flag(@site, :estado)
		msg = "Has estado aqui."
	end
	redirect_to @site, :notice => msg
  end

  # GET /sites
  # GET /sites.xml
  def index
 
   if params[:type_id].nil? or params[:type_id].empty? and !params[:tipositio].nil?
      @sites = Site.where(:tipositio => params[:tipositio])
      @tipo = params[:tipositio]
   elsif params[:tipositio].nil? or params[:tipositio].empty? and !params[:type_id].nil?
      @sites = Type.find(params[:type_id]).sites
      @provincia = Type.find(params[:type_id]).name
   elsif !params[:type_id].nil?  and !params[:tipositio].nil?
      @sites = Site.where(:tipositio => params[:tipositio], :type_id => params[:type_id])
      @provincia = Type.find(params[:type_id]).name
   elsif !params[:user_id].nil?
      @sites = Site.where(:user_id => params[:user_id])
   elsif params[:type_id].nil? and params[:tipositio].nil? 
      @sites = Site.all
   else
      @sites = Site.where(:tipositio => params[:tipositio], :type_id => params[:type_id])
      @provincia = Type.find(params[:type_id]).name
      @tipo = params[:tipositio]
   end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sites }
    end
  end

  # GET /sites/1
  # GET /sites/1.xml
  def show
    @site = Site.find(params[:id])
    @user = User.find_by_id(@site.user_id)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @site }
    end
  end

  # GET /sites/new
  # GET /sites/new.xml
  def new

   if params[:type_id] and params[:tipositio]
      @site.type_id = params[:type_id]
      @site.tipositio = params[:tipositio]
      @site.user = current_user
   elsif params[:type_id]
      @site.type_id = params[:type_id]
      @site.user = current_user
   elsif params[:tipositio]
      @site.tipositio = params[:tipositio]
      @site.user = current_user
   else
      @site.user = current_user
   end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @site }
    end
  end

  # GET /sites/1/edit
  def edit
  end

  # POST /sites
  # POST /sites.xml
  def create
    @site.user = current_user

    respond_to do |format|
      if @site.save
        sube_karma
        format.html { redirect_to(@site, :notice => 'Nueva localidad creada.') }
        format.xml  { render :xml => @site, :status => :created, :location => @site }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @site.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sites/1
  # PUT /sites/1.xml
  def update

    respond_to do |format|
      if @site.update_attributes(params[:site])
        format.html { redirect_to(@site, :notice => 'Localidad actualizada correctamente.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @site.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sites/1
  # DELETE /sites/1.xml
  def destroy
    @site.destroy

    respond_to do |format|
      format.html { redirect_to(sites_url) }
      format.xml  { head :ok }
    end
  end

   def search 
     str=params[:q]
     @sites = Site.where("LOWER (name) LIKE ? OR LOWER (description) LIKE ?", "%#{str.downcase}%", "%#{str.downcase}%")
   end

  private

  def count_visit
    @site.increment!(:visits)
  end

  def sube_karma
    @user = User.find(@site.user_id)
    @user.increment!(:karma)
  end

  def baja_karma
    @user = User.find(@site.user_id)
    @user.decrement!(:karma)
  end
end

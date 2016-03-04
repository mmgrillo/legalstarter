class ProjectsController < ApplicationController
	
	before_action :authenticate_user!, except: [:index, :show] 
#este before_action :set_project (podia ter qq outro nome) permite a todos 
#os methods em baixo usufruirem de: @project = Project.find(params[:id])
#em vez de estar a inserir em todos, faz-se assim para ser DRY code. 
	before_action :set_project, only: [:show, :edit, :update, :destroy] 


	def index
		@projects = Project.all
		@displayed_projects = Project.take(4)
	end

	def new
		@project = Project.new
	end

	def show
	end

	def edit
	end

	def create
		@project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Product was successfully created.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  	respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  	@project.destroy
  	respond_to do |format|
        format.html { redirect_to @project, notice: 'Product was successfully destroyed.' }
        format.json { head :no_content }
    end
  end



  private

  def project_params
		params.require(:project).permit(:name, :short_description, :description, :image_url, :goal, :expiration_date)  
  end

  def set_project
  	@project = Project.find(params[:id])
  end


end

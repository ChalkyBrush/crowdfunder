class ProjectsController < ApplicationController
	

    def index
    	@projects = Project.order('projects.created_at DESC').page(params[:page])
  	end

  	def show
         @project = Project.find(params[:id])
  	end

  	def project_params
    	params.require(:title).permit(:teaser, :title, :description, :goal, :user_id)
  	end

    def create
    @pledge = @project.pledges.build params[:pledge]
    @pledge.user = current_user

    if @pledge.save
      UserMailer.new_pledge(@pledge).deliver #will now send emails when a pledge is created
      redirect_to @project, notice: "Nice! Thanks for pledging $#{@pledge.amount} for this project."
    else
      render :new
    end
  end


end

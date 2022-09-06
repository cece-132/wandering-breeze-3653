class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])
    @avg_experience = @project.contestant_avg_experience
  end
end
class ContestantProjectsController < ApplicationController
  def create
    added_contestant = ContestantProject.create!(contestant_id: params[:contestant_id],
                                                  project_id: params[:format])
    
    if added_contestant.save
      redirect_to project_path(params[:format])
    else
      flash[:alert] = "User not found"
      redirect_to project_path(params[:format])
    end
  end

  private

  def contestant_project_params
    params.permit(:contestant_id, :project_id)
  end
end
class IdeasController < ApplicationController
  def random
    unless session[:current_concern].blank?
      @concern = Concern.find(session[:current_concern])
    end
    if @concern.blank?
      @idea = Idea.order('random()').first
    else
      @idea = @concern.ideas.order('random()').first
    end
    redirect_to @idea
  end

  def show
    unless session[:current_concern].blank?
      @concern = Concern.find(session[:current_concern])
    end
    @concern_name = (@concern && @concern.name) || "America"
    @idea = Idea.find_by_slug(params[:id])
    @social_description = @idea.name
    @one_screen = true
  end
end

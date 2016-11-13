class IdeasController < ApplicationController
  def random
    @idea = Idea.order('random()').first
    redirect_to @idea
  end

  def show
    @idea = Idea.find_by_slug(params[:id])
  end
end

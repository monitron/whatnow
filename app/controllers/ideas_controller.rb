class IdeasController < ApplicationController
  def random
    unless session[:current_concern].blank?
      @concern = Concern.find(session[:current_concern])
    end
    ideas = @concern.blank? ? Idea : @concern.ideas
    @idea = ideas.where(approved: true).order('random()').first
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

  def new
    @idea = Idea.new
    @concerns = Concern.all
  end

  def create
    @idea = Idea.new(params.require(:idea).permit(:concern_id, :name,
      :action_url, :description, :contributor_name, :contributor_place))
    unless @idea.save
      @concerns = Concern.all
      render "new"
    end
  end

  def click
    @idea = Idea.find_by_slug(params[:id])
    if @idea.nil? then not_found end
    @idea.increment! :click_count
    render :json => {}, status: :ok
  end
end

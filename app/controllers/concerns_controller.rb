class ConcernsController < ApplicationController
  def index
    @concerns = Concern.all
  end

  def show
    begin
      @concern = Concern.find(params[:id])
      session[:current_concern] = @concern.id
    rescue ActiveRecord::RecordNotFound
      session[:current_concern] = nil
    end
    redirect_to random_ideas_path
  end

  def reset
    session[:current_concern] = nil
    redirect_to random_ideas_path
  end
end

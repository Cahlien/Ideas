class IdeasController < ApplicationController
  before_action :set_idea, except: %i[new create index]

  def index
    @ideas = Idea.all
  end

  def show; end

  def edit; end

  def update
    if @idea.update(idea_params)
      redirect_to :ideas
    else
      puts @idea
      render :edit
    end
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_params)
    if @idea.save
      redirect_to :ideas
    else
      render :new
    end
  end

  def destroy
    set_idea
    if@idea.destroy
      redirect_to :ideas
    end
  end

  private

  def set_idea
    @idea = Idea.find(params[:id])
  end

  def idea_params
    params.require(:idea)
          .permit(:name, :description, :priority)
  end
end

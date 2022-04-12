class TasksController < ApplicationController
  before_action :require_user
  before_action :require_same_user, only: [:show, :update, :edit]
  before_action :set_task, only: [:show, :update, :edit, :destroy]

  def show
  end

  def index
    @tasks = current_user.tasks
  end

  def new
    @task = Task.new()
  end

  def create
    @task = Task.new(get_params)
    @task.created_by = current_user.username
    
    if @task.save
      @task.users << current_user
      flash[:notice] = "A new task has been created!"
      redirect_to tasks_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    
    # collab_users = get_params[:collaborators].split(/\s*,\s*/)
    # collab_users.each do |user|
    #   @task << User.find_by_email(user) if !@task.users.any?{|a| a.email == user}
    # end
    if @task.update(get_params)
      flash[:notice] = "Task is updated successfully!"
      redirect_to tasks_path
    else
      render 'edit'
    end
  end

  def destroy
    @task.destroy
    flash[:message] = "Task was successfully deleted!"
    redirect_to tasks_path
  end

  private 
  def set_task
    @task = Task.find(params[:id])
  end

  def get_params
    byebug
    params.require(:task).permit(:title, :description, :priority, :status, :collaborators)
  end
  def get_special_params
    params = params.require(:task).permit(:title, :description, :priority, :status, :collaborators)
    collabs = params[:collaborators].split(/\s*,\s*/)
    collabs.each do |user|
      @task << User.find_by_email(user) if !@task.users.any?{|a| a.email == user}
    end
  end

  def require_same_user
    task = set_task
    if !task.users.include? current_user
      flash[:alert] = "You can only view tasks which you are a collaborator on."
      redirect_to tasks_path
    end
  end

end
class TasksController < ApplicationController
  before_action :require_user
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
      flash[:message] = "A new task has been created!"
      redirect_to tasks_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(get_params)
      flash[:message] = "Task is updated successfully!"
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
    params.require(:task).permit(:title, :description, :priority, :status)
  end

end
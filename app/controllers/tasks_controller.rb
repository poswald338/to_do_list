class TasksController < ApplicationController
  before_action :require_user
  before_action :require_same_user, only: [:show, :update, :edit]
  before_action :set_task, only: [:show, :update, :edit, :destroy]

  def remove_user
    @task = Task.find(params[:task])
    @user = User.find(params[:user])
    if @task.users.destroy(@user)
      flash[:notice] = "User has been removed from the task."
      redirect_to @task
    else
      flash[:alert] = "Something went wrong."
    end
  end

  def show
    
  end

  def index
    query = params[:search]
    case query
    when "Complete"
      @tasks = current_user.tasks.completed.order('created_at DESC')
    when "Incomplete"
      @tasks = current_user.tasks.incomplete.order('created_at DESC')
    when "In Progress"
      @tasks = current_user.tasks.in_progress.order('created_at DESC')
    else 
      @tasks = current_user.tasks.order('created_at DESC')
    end
  end

  def new
    @task = Task.new()
  end

  def create
    @task = Task.new(get_params)
    @task.created_by = current_user.username
    
    if @task.save
      @task.users << current_user
      if get_special_params[:users] != nil
      get_special_params[:users].split(/\s*,\s*/).each do |email|
        if @user = User.find_by_email(email)
          if !@task.users.any?{|a| a.email == email}
            (@task.users << @user)
            notif = Notification.new(title: "Hi", note: "you have been added to a task!", sender_id: current_user.id, recipient_id: @user.id)
            @user.notifications << notif
          end
        end
      end
        flash[:notice] = "A new task has been created!"
        redirect_to tasks_path
      end
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(get_params)
      get_special_params[:users].split(/\s*,\s*/).each do |email|
        if @user = User.find_by_email(email)
          if !@task.users.any?{|a| a.email == email}
            (@task.users << @user)
            notif = Notification.new(title: "Hi", note: "you have been added to a task!", sender_id: current_user.id, recipient_id: @user.id)
            @user.notifications << notif
          end
        end
      end
      flash[:notice] = "Task is updated successfully!"
      redirect_to tasks_path
    else
      render 'edit'
    end
  end

  def destroy
    @task.destroy
    flash[:notice] = "Task was successfully deleted!"
    redirect_to tasks_path
  end

  private 
  def set_task
    @task = Task.find(params[:id])
  end

  def get_params
    params.require(:task).permit(:title, :description, :priority, :status)
  end
  def get_special_params
    params.require(:task).permit(:users)
  end

  def require_same_user
    task = set_task
    if !task.users.include? current_user
      flash[:alert] = "You can only view tasks which you are a collaborator on."
      redirect_to tasks_path
    end
  end

end
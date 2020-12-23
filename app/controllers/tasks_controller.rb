class TasksController < ApplicationController
  before_action :user_logged_in, only: %i[index create general done]

  def index
    @tasks = current_user.tasks.where('status = false').order(group_id: :desc)
    @new_task = current_user.tasks.build
  end

  def general
    @tasks = current_user.tasks.where('group_id IS NULL AND status = false').order(group_id: :desc)
    @new_task = current_user.tasks.build
  end

  def create
    @tasks = Task.create(tasks_params)
    if @tasks.errors.any?
      flash[:error] = @tasks.errors.full_messages
      if params[:task][:group_id] == ''
        redirect_to tasks_path
      else
        redirect_to group_path(params[:task][:group_id])
      end
    else
      @tasks.save
      if params[:task][:group_id] == ''
        redirect_to tasks_path
      else
        redirect_to group_path(params[:task][:group_id])
      end
    end
  end

  def toggle
    task = Task.find(params[:id])
    task.status = !task.status
    task.save
    redirect_to tasks_done_path
  end

  def done
    @tasks = current_user.tasks.where('status = true').order(group_id: :desc)
    @new_task = current_user.tasks.build
  end

end

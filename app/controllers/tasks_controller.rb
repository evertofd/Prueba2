class TasksController < ApplicationController
  def index

    @tasks_not_complete = Task.where('id NOT IN (SELECT DISTINCT(task_id) FROM taskcompleteds)')

    @tasks_complete = Task.where('id IN (SELECT DISTINCT(task_id) FROM taskcompleteds)')
  end

  def show
    @task = Task.find(params[:id])
    @users_task_completed = Taskcompleted.where(:task_id => params[:id])
    @five_first = Taskcompleted.all.where(task_id: @task).order(:created_at).limit(5).pluck('user_id')
  end

end

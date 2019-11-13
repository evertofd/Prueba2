class CompletedsController < ApplicationController
  before_action :authenticate_user!

  def create()
    @task_id = params[:task_id]

    @task = Task.find(@task_id)

    @exist_task = Taskcompleted.find_by(task_id: @task.id, user_id: current_user.id)

    if @exist_task
      Taskcompleted.destroy(@exist_task.id)
      redirect_to tasks_path
    else
      @completed = Taskcompleted.new(task: @task, user: current_user)
      if @completed.save
        redirect_to tasks_path, noticia: 'Se completo la tarea'
      else
        redirect_to tasks_path, alert: 'no se pudo completar la tarea'
      end
    end
  end
end

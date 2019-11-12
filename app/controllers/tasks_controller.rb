class TasksController < ApplicationController
  def index

    @tasks_not_complete = Task.where('id NOT IN (SELECT DISTINCT(task_id) FROM taskcompleteds)')

    @tasks_complete = Task.where('id IN (SELECT DISTINCT(task_id) FROM taskcompleteds)')
  end

end

class DetailsController < ApplicationController
  def detail
    @tasks_list = Task.where('id IN (SELECT DISTINCT(task_id) FROM taskcompleteds)')
    @tasks_completeds = Taskcompleted.all


    @hash_detail = []
    @tasks_list.each do |task|
        @users = []
        @tasks_completeds.each do |task_complete|
          if task.id == task_complete.task_id
            @users << User.find(task_complete.user_id).email
          end
        end
      @hash_detail.push({:name => task.name, :users => @users})
    end
  end
end

class TasksController < ApplicationController

  def index
    @task = Task.new
    @tasks = Task.where('start_at > ?', Time.zone.now).order(start_at: :asc)
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to tasks_path
  end

  def update
    @task = Task.find(params[:id])
    if @task.finished == false
      @task.finished = true
      @task.save
      redirect_to tasks_path
    else
      render :index, alert: '既にタスク「#{task.title}」は完了しています '
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :content, :start_at, :finish_at, :kind, :finished)
  end
end

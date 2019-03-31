class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)
    flash[:info] = "投稿を投稿しました"
    redirect_to tasks_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    flash[:info] = "投稿を編集しました"
    redirect_to tasks_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:danger] = "投稿を削除しました"
    redirect_to tasks_path
  end

  private
    def task_params
      params.require(:task).permit(:title)
    end

end

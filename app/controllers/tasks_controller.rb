class TasksController < ApplicationController
  before_action :find_by_id, only: %i[show edit update destroy]
  before_action :task_params, only: [:create]
  # after_action :redirect_to_list, only: %i[create destroy]
  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)
    redirect_to tasks_path
  end

  def edit
  end

  def update
    @task.update(task_params)
    redirect_to task_path(@task.id)
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def find_by_id
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  # def redirect_to_list
  #   redirect_to tasks_path
  # end
end

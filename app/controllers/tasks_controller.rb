class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    # GET /tasks
    @tasks = Task.all
  end

  def show
    # GET /tasks/:id
    # @task = Task.find(params[:id])
  end

  def new
    # GET /restaurants/new
    @task = Task.new
  end

  def create
    # POST /restaurants
    @task = Task.new(task_params)
    if @task.save
      redirect_to task_path(@task)
    else
    # no need for app/views/restaurants/create.html.erb
      redirect_to tasks_path
    end
  end

  def edit
    # GET /restaurants/:id/edit
    # @task = Task.find(params[:id])
  end

  def update
    # PATCH /restaurants/:id
    # @task = Task.find(params[:id])
    @task.update(task_params)

    # no need for app/views/restaurants/update.html.erb
    redirect_to @task
  end

  def destroy
    # @task = Task.find(params[:id])
    @task.destroy

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end

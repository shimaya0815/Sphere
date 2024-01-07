class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy]
  before_action :validate_office_id, only: [:index, :show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @todos = if params[:only_my_assignments]
               current_user.todos.where(assignee_id: current_user.id, office_id: current_user.office_id)
             else
               current_user.todos.where(office_id: current_user.office_id)
             end
  end

  def show
  end

  def new
    @todo = current_user.todos.build
  end

  def create
    @todo = current_user.todos.build(todo_params)
    @todo.office_id = current_user.office_id

    if @todo.save
      redirect_to todo_path(id: @todo.id, office_id: current_user.office_id), notice: 'Todo was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @todo.update(todo_params)
      redirect_to todo_path(id: @todo.id, office_id: current_user.office_id), notice: 'Todo was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @todo.destroy
    redirect_to todos_path(office_id: current_user.office_id), notice: 'Todo was successfully destroyed.'
  end

  private

  def set_todo
    @todo = Todo.find_by(id: params[:id], office_id: current_user.office_id)
  end

  def todo_params
    params.require(:todo).permit(:title, :description, :assignee_id, :deadline, :tax_client_id)
  end

  def validate_office_id
    if params[:office_id] != current_user.office_id
      redirect_to root_path, alert: "Access denied."
    end
  end
end

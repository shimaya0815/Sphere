class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /todos
  def index
    @todos = current_user.todos
  end

  # GET /todos/1
  def show
  end

  # GET /todos/new
  def new
    @todo = current_user.todos.build
  end

  # POST /todos
  def create
    @todo = current_user.todos.build(todo_params)
    if @todo.save
      redirect_to @todo, notice: 'Todo was successfully created.'
    else
      render :new
    end
  end

  # GET /todos/1/edit
  def edit
  end

  # PATCH/PUT /todos/1
  def update
    if @todo.update(todo_params)
      redirect_to @todo, notice: 'Todo was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /todos/1
  def destroy
    @todo.destroy
    redirect_to todos_url, notice: 'Todo was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions
    def set_todo
      @todo = current_user.todos.find(params[:id])
    end

    # Only allow a list of trusted parameters through
    def todo_params
      params.require(:todo).permit(:title, :description)
    end
end

class TodosController < ApplicationController

  before_action :initialize_todo, only: [:show, :edit, :update, :destroy]

  def new
    @todo = Todo.new()
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      # Save message to flash for later use in view
      flash[:notice] = "Todo was successfully saved !"

      redirect_to todo_path(@todo)
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @todo.update(todo_params)
      # Save message to flash for later use in view
      flash[:notice] = "Todo was successfully updated !"

      redirect_to todo_path(@todo)
    else
      render 'edit'
    end
  end

  def destroy
    if @todo.destroy
      flash[:notice] = "Todo was successfully deleted !"
      redirect_to todos_path
    end
  end

  def index
    @todos = Todo.all
  end

  private
    def todo_params
      params.require(:todo).permit(:name, :description)
    end

    def initialize_todo
      @todo = Todo.find(params[:id])
    end

end
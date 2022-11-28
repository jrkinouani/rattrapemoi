class TodoListsController < ApplicationController
	before_action :set_todo_list, only: %i[edit show destroy update]

	def index
		@todo_lists = TodoList.all
	end

	def new
		@todo_list = TodoList.new
	end

	def create
		@todo_list = TodoList.new(params_todo_list)
		@todo_list.user = current_user
		if @todo_list.save
			redirect_to todo_list_path(@todo_list)
		else
			render :new, status: :unprocessable_entity
		end
	end

	def show
	end

	def edit
	end

	def update
		@todo_list.update(params_todo_list)
		redirect_to todo_list_path(@todo_list)
	end

	def destroy
		@todo_list.destroy
		redirect_to todo_lists_path  status: :see_other
	end

	private

	def set_todo_list
		@todo_list = TodoList.find(params[:id])
	end

	def params_todo_list
		params.require(:todo_list).permit(:title)
	end
end

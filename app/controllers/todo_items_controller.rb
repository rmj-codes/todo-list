class TodoItemsController < ApplicationController
  before_action :set_todo_item, only: %i[show edit update destroy change_status]

  # GET /todo_items
  def index
    @todo_items = filter_todo_items
    @current_filter = params[:status] || "all"
    set_status_counts

    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  # GET /todo_items/1
  def show
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to root_path(anchor: "todo_item_#{@todo_item.id}") }
    end
  end

  # GET /todo_items/new
  def new
    @todo_item = TodoItem.new
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to todo_items_path }
    end
  end

  # GET /todo_items/cancel_new
  def cancel_new
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove("new_todo_item") }
    end
  end

  # GET /todo_items/1/edit
  def edit
    respond_to do |format|
      format.html { redirect_to root_path(anchor: "todo_item_#{@todo_item.id}") }
      format.turbo_stream
    end
  end

  # POST /todo_items
  def create
    @todo_item = TodoItem.new(todo_item_params)
    respond_to do |format|
      if @todo_item.save
        format.turbo_stream {
          render turbo_stream: [
            turbo_stream.remove("new_todo_item"),
            turbo_stream.prepend("todo_items_list", partial: "todo_items/todo_item", locals: { todo_item: @todo_item })
          ]
        }

      else
        format.turbo_stream { render turbo_stream: turbo_stream.update("new_todo_item", partial: "todo_items/form", locals: { todo_item: @todo_item }) }
      end
    end
  end

  # PATCH /todo_items/1/change_status
  def change_status
    @todo_item.status = params[:status]

    respond_to do |format|
      if @todo_item.save
        set_status_counts
        format.turbo_stream
      else
        format.html { redirect_to @todo_item, status: :unprocessable_entity, alert: "Unable to update status." }
      end
    end
  end

  # PATCH/PUT /todo_items/1
  def update
    respond_to do |format|
      if @todo_item.update(todo_item_params)
        format.turbo_stream {
          render turbo_stream: turbo_stream.replace("todo_item_#{@todo_item.id}", partial: "todo_items/todo_item", locals: { todo_item: @todo_item })
        }
      else
        format.turbo_stream { render partial: "todo_items/form", locals: { todo_item: @todo_item } }
      end
    end
  end

  # DELETE /todo_items/1
  def destroy
    @todo_item.destroy!
    set_status_counts
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_todo_item
    @todo_item = TodoItem.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to todo_items_path, alert: "Todo item not found."
  end

  # Filter todo items based on status parameter
  def filter_todo_items
    scope = TodoItem.recent

    if params[:status].present? && params[:status] != "all"
      scope = scope.by_status(params[:status])
    end

    scope
  end

  # Set counts for each status
  def set_status_counts
    @current_filter = params[:current_filter] || params[:status] || "all"
    @all_todo_items_count = TodoItem.count
    @pending_count = TodoItem.pending.count
    @in_progress_count = TodoItem.in_progress.count
    @completed_count = TodoItem.completed.count
  end

  # Only allow a list of trusted parameters through.
  def todo_item_params
    params.require(:todo_item).permit(:title, :description, :status)
  end
end

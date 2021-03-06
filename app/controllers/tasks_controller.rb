class TasksController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:edit, :update, :show, :destroy]

  def index
    @tasks = Task.all
  end
  
  def show
#    @task = Task.find(params[:id])　　#19-8-16 deleted
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(tsk_params)

    if @task.save
      flash[:success] = 'タスクが正常に投稿されました'
      redirect_to @task
    else
      flash.now[:danger] = 'タスクが投稿されませんでした'
      render :new
    end    
  end

  def edit
#    @task = Task.find(params[:id])  #19-8-16 deleted
  end

  def update
#    @task = Task.find(params[:id]) #19-8-16 deleted

    if @task.update(tsk_params)
      flash[:success] = 'タスクは正常に更新されました'
      redirect_to @task
    else
      flash.now[:danger] = 'タスクは更新されませんでした'
      render :edit
    end    
  end

  def destroy
#    @task = Task.find(params[:id]) #19-8-16 deleted
    @task.destroy

    flash[:success] = 'タスクは正常に削除されました'
    redirect_to tasks_url
  end

private
# Strong Parameter
  def tsk_params
    params.require(:task).permit(:content, :status)
  end

  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
      redirect_to root_url
    end
  end
  
end

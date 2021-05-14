class TasksController < ApplicationController
    #タスクの一覧ページ
    def index
        @tasks = Task.all
    end
    #タスクの詳細ページ
    def show
        @task = Task.find(params[:id])
    end
    #タスク新規作成ページ
    def new
        @task = Task.new
    end
    
    def create
        @task = Task.new(task_params)
        
        if @task.save
            flash[:success] = "Taskが正常に作成されました"
            redirect_to @task
        else
            flash.now[:danger] = "Taskが作成できませんでした"
            render :new
        end
    end
    
    def edit
        @task = Task.find(params[:id])
    end
    
    def update
         @task = Task.find(params[:id])
        
        if @task.update(task_params)
            flash[:success] = "Taskは正常に更新されました"
            redirect_to @task
        else
            flash[:danger] = "Taskは更新されませんでした"
            render :edit
        end
    end
    
    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        
        flash[:success] = "Taskは正常に削除されました"
        redirect_to tasks_url
    end
    
    private
    
    
    #Strong Parameter
    def task_params
        params.require(:task).permit(:content)
    end
end

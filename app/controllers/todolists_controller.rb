class TodolistsController < ApplicationController
  def new
    @list = List.new
  end

  def create
    #データを新規投稿するためのインスタンス作成
    list = List.new(list_params)
    #データをデータベースに保存するためのsaveメソッド
    list.save
    #トップ画面へのリダイレクト
    redirect_to todolist_path(list.id)
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to todolist_path(list.id)
  end

  private
  #ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body)
  end

end
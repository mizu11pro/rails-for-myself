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
    redirect_to '/top'
  end

  private
  #ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body)
  end

end
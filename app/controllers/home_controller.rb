# -*- encoding : utf-8 -*-
class HomeController < ApplicationController
layout "home"
  def index
    @pictures = Picture.where(kind: 1)
  end
  def products
        @wssc = Product.where(kind: 2)
        @dzjyh= Product.where(kind: 3)
        @qtyy = Product.where(kind: 4)
        @pictures = Picture.where(kind: 3)
  end

  def informations
    @search = Info.ransack(params[:q])
    @pictures = Picture.where(kind: 0)
    @contents = @search.result.order("id desc").page(params[:page]).per(20)
    @picture = Picture.where(kind: 4)
  end

  # def ajax_query
  #   words = params[:search]
  #   @infos = Info.where("title like?", "%#{words}%" ).select(:title).distinct
  #   render json: {users: @infos.map { |e| {id: e.title, text: e.title } }}
  # end    

  def abouts
    @countrys = Picture.where(kind: 8)
    @zmd = Picture.where(kind: 7)
    @pictures = Picture.where(kind: 5)
    @content = About.find(1)
    @distribut = About.find(3)
  end

  def contacts
    @lxwm = About.find(3)
    @pictures = Picture.where(kind: 6)
  end 

  def prod_extras
     @content = Product.find(params[:id])
  end

  def infos_extras
     @search = Info.ransack(params[:q])
     @contents = Info.find(params[:id])
     @picture = Picture.where(kind: 4)
     @prev = Info.where("id < ?", @contents.id).last
     @next = Info.where("id > ?", @contents.id).first
     @prev_page = true  if @prev 
     @next_page = true   if  @next
  end

end

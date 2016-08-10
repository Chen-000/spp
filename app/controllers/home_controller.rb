# -*- encoding : utf-8 -*-
class HomeController < ApplicationController
layout "home"
  def index
    @pictures = Picture.where(kind: 1)
    @content = About.find(1)
    @info = Info.where(kind: 0)
    @picture = Picture.where(kind: 4)
    #公司产品
    @wssc = Product.where(kind: 2)
    @dzjyh= Product.where(kind: 3)
    @qtyy = Product.where(kind: 4)
    #新闻资讯
    @search = Info.ransack(params[:q])
    @infos = @search.result.order("id desc").page(params[:page]).per(20)
    #经典案例
    name = Nav.where(kind: 3).first.name
    nav = Nav.where(name: name).last
    @case_content = nav.detail
  end

  def products
        @wssc = Product.where(kind: 2)
        @dzjyh= Product.where(kind: 3)
        @qtyy = Product.where(kind: 4)
        @pictures = Picture.where(kind: 3)
        @nav = Nav.where(kind:2)
  end

  def informations
    @search = Info.ransack(params[:q])
    @info = Info.where(kind: 0)
    @infos = @search.result.order("id desc").page(params[:page]).per(20)
    @picture = Picture.where(kind: 4)
  end

  def nav_detail
    @nav = Nav.where("kind = ? and id = ?",2,params[:id])
  end

  def cases
    name = Nav.where(kind: 3).first.name
    nav = Nav.where(name: name).last
    @case_content = nav.detail
    @picture = Picture.where(kind: 10)
    #@nav = Nav.where("kind = ? and id = ?",3,params[:id])
  end

  def employ
    name = Nav.where(kind: 6).first.name
    nav = Nav.where(name: name).last
    @content = nav.detail
    @picture = Picture.where(kind: 9)
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
    @contacts = Contact.all
  end

  def contacts
    @contacts = Contact.all
    @pictures = Picture.where(kind: 6)
  end 

  def prod_extras
     @content = Product.find(params[:id])
     @picture = Picture.where(kind: 3)
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

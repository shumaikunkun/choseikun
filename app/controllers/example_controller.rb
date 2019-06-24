
class ExampleController < ApplicationController

  def home

  end

  def vote
    @day=Daymodel.where(num:params[:num]).pluck(:day)
    @hour=Hourmodel.where(num:params[:num]).pluck(:hour).map!(&:to_i)  #時間を整数化
  end

  def confirm
    @day=Daymodel.where(num:params[:num]).pluck(:day)
    @hour=Hourmodel.where(num:params[:num]).pluck(:hour).map!(&:to_i)  #時間を整数化

    @name=params['name']
    @time=Time.now.strftime("%Y年%m月%d日 %H:%M:%S")
    @test=params[:checklist]
    @test1=Array.new(@day.size){Array.new(@hour.size,0)}
    @test.each do |k,v|
      #Shosai.create(name:@name,key:k,value:v,num:params[:num])  #データベース格納
      @test1[@day.index(k.split("-")[0])][@hour.index(k.split("-")[1].to_i)]=v
    end
  end

  def show
    @day=Daymodel.where(num:params[:num]).pluck(:day)
    @hour=Hourmodel.where(num:params[:num]).pluck(:hour).map!(&:to_i)  #時間を整数化

    @all_user=Shosai.where(num:params[:num]).pluck(:name).uniq  #ユーザー一覧
    @all_datas={}
    @all_user.each do|u|
      @all_data={}
      Shosai.where(name:u).where(num:params[:num]).each{|s|@all_data.store(s.key,s.value)}
      @all_datas.store(u,@all_data)
    end
  end

  def memo

  end
end

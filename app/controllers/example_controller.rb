
class ExampleController < ApplicationController
  def vote
    @day=['7/20','7/21','7/22','7/23','7/24',]
    @hour=[10,11,12,13,14,15,16]
  end

  def confirm
    @day=['7/20','7/21','7/22','7/23','7/24',]
    @hour=[10,11,12,13,14,15,16]

    @name=params['name']
    @time=Time.now.strftime("%Y年%m月%d日 %H:%M:%S")
    @test=params[:checklist]
    @test1=Array.new(@day.size){Array.new(@hour.size,0)}
    @test.each do |k,v|
      #Shosai.create(name:@name,key:k,value:v)  #データベース格納
      @test1[@day.index(k.split("-")[0])][@hour.index(k.split("-")[1].to_i)]=v
    end
  end

  def show
    @day=['7/20','7/21','7/22','7/23','7/24',]
    @hour=[10,11,12,13,14,15,16]

    @all_user=Shosai.pluck(:name).uniq  #ユーザー一覧
    @all_datas={}
    @all_user.each do|u|
      @all_data={}
      Shosai.where(name:u).each{|s|@all_data.store(s.key,s.value)}
      @all_datas.store(u,@all_data)
    end
  end

  def memo

  end
end

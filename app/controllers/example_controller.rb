
class ExampleController < ApplicationController

  def home
    @page_count=Daymodel.pluck(:num).uniq.size  #今まで作成したページの数=>次のページの番号

  end

  def inform
    @input_day=params[:day].split(",").map{|d|d.split("/").map{|n|p n.to_i}.join("/")}  #入力した日付を整数化し配列にする
    @input_hour=(params[:start]..params[:finish]).to_a.map!(&:to_i)
  end

  def vote
    @day=Daymodel.where(num:params[:num]).pluck(:day)
    @hour=Hourmodel.where(num:params[:num]).pluck(:hour).map!(&:to_i)  #時間を整数化
    @page_count=Daymodel.pluck(:num).uniq.size  #今まで作成したページの数=>次のページの番号
                                                #=>ワイルドカードがこれより小さかったら未配置なので投票できなくする
  end

  def confirm
    @day=Daymodel.where(num:params[:num]).pluck(:day)
    @hour=Hourmodel.where(num:params[:num]).pluck(:hour).map!(&:to_i)  #時間を整数化

    @name=params['name']  #投票者名
    @time=Time.now.strftime("%Y年%m月%d日 %H:%M:%S")  #投票時間
    @test=Array.new(@day.size){Array.new(@hour.size,0)}  #二次元配列生成
    params[:checklist].each do |k,v|
      #Shosai.create(name:@name,key:k,value:v,num:params[:num])  #データベース格納
      @test[@day.index(k.split("-")[0])][@hour.index(k.split("-")[1].to_i)]=v
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

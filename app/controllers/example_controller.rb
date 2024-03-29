
class ExampleController < ApplicationController

  #次の修正箇所=>同じ変数宣言をやめる
  #スーパークラスに変数を記述して継承させるか、クラス変数にして同じクラスで別のメソットから呼び出せるようにする

  def home
    @page_count=Daymodel.pluck(:num).uniq.size  #今まで作成したページの数=>次のページの番号
  end

  before_action :basic_auth, only: [:all] #allに参照する際にBasic認証する

  def basic_auth
    #http_basic_authenticate_with name:"amazon", password:"candidate"
    authenticate_or_request_with_http_basic do|n,p|
      n=="shumai" && p=="kun"
    end
  end

  def all
    @all_num=Daymodel.pluck(:num).uniq
  end

  def inform
    @input_day=params[:day].split(",").map{|d|d.split("/").map{|n|p n.to_i}.join("/")}  #入力した日付を整数化し配列にする
    @input_hour=(params[:start]..params[:finish]).to_a.map!(&:to_i)
    @page_count=Daymodel.pluck(:num).uniq.size  #今まで作成したページの数=>次のページの番号
    #Hashmodel.create(random:SecureRandom.alphanumeric(7),num:@page_count)
    @input_day.each{|d|Daymodel.create(day:d,num:@page_count)}
    @input_hour.each{|h|Hourmodel.create(hour:h,num:@page_count)}
    @title=params[:title]
    Title.create(title:@title,num:@page_count)
  end

  def vote
    @day=Daymodel.where(num:params[:num]).pluck(:day)
    @hour=Hourmodel.where(num:params[:num]).pluck(:hour).map!(&:to_i)  #時間を整数化
    @page_count=Daymodel.pluck(:num).uniq.size  #今まで作成したページの数=>次のページの番号
                                                #=>ワイルドカードがこれより大きかった未配置なので投票できなくする
    @title=Title.where(num:params[:num]).pluck(:title).join  #配列型で返されてしまうため文字列に戻す
  end

  def confirm
    @day=Daymodel.where(num:params[:num]).pluck(:day)
    @hour=Hourmodel.where(num:params[:num]).pluck(:hour).map!(&:to_i)  #時間を整数化

    @name=params['name']  #投票者名
    @time=Time.now.strftime("%Y年%m月%d日 %H:%M:%S")  #投票時間
    @test=Array.new(@day.size){Array.new(@hour.size,0)}  #二次元配列生成
    params[:checklist].each do |k,v|
      Shosai.create(name:@name,key:k,value:v,num:params[:num])  #データベース格納
      @test[@day.index(k.split("-")[0])][@hour.index(k.split("-")[1].to_i)]=v
    end
    @title=Title.where(num:params[:num]).pluck(:title).join
  end

  def show
    @day=Daymodel.where(num:params[:num]).pluck(:day)
    @hour=Hourmodel.where(num:params[:num]).pluck(:hour).map!(&:to_i)  #時間を整数化
    @page_count=Daymodel.pluck(:num).uniq.size  #今まで作成したページの数=>次のページの番号
                                                #=>ワイルドカードがこれより大きかった未配置なので投票できなくする
    @all_user=Shosai.where(num:params[:num]).pluck(:name).uniq  #ユーザー一覧
    @all_datas={}
    @all_user.each do|u|
      @all_data={}
      Shosai.where(name:u).where(num:params[:num]).each{|s|@all_data.store(s.key,s.value)}
      @all_datas.store(u,@all_data)
    end
    @title=Title.where(num:params[:num]).pluck(:title).join
  end

  def memo
    @random=[]
    30.times{@random.push(SecureRandom.alphanumeric(7)) }
  end
end

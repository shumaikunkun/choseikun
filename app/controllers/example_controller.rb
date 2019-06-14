
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
    params[:checklist].each do |k,v|
      @test1[@day.index(k.split("-")[0])][@hour.index(k.split("-")[1].to_i)]=v
    end
  end
end

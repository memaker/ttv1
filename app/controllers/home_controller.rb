class HomeController < ApplicationController
  def index
    @users = User.all
    
    @h = LazyHighCharts::HighChart.new('graph', style: '') do |f|
      f.options[:chart][:defaultSeriesType] = "area"
      f.options[:plotOptions] = {areaspline: {pointInterval: 1.day, pointStart: 10.days.ago}}
      f.series(:name=>'John', :data=>[3, 20, 3, 5, 4, 10, 12 ,3, 5,6,7,7,80,9,9])
      f.series(:name=>'Jane', :data=> [1, 3, 4, 3, 3, 5, 4,-46,7,8,8,9,9,0,0,9])
      f.xAxis(type: :datetime)
    end
  end
end

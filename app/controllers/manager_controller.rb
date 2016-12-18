class ManagerController < ApplicationController
	  #before_action :require_manager, only: [:main, :draw_rates , :top_dishes]
  
  def main
  end

  def draw_rates
  	@one = Rating.where(num_stars: 1).take.num_times_rated
  	@two = Rating.where(num_stars: 2).take.num_times_rated
  	@three = Rating.where(num_stars: 3).take.num_times_rated
  	@four = Rating.where(num_stars: 4).take.num_times_rated
  	@five = Rating.where(num_stars: 5).take.num_times_rated
  	@chart = Fusioncharts::Chart.new({
        :height => 400,
        :width => '90%',
        :type => 'mscolumn2d',
        :renderAt => 'chart-container',
        :dataSource => {
          :chart => {
            :caption => 'Rates',
            :xAxisname => 'Rate',
            :yAxisName => 'Votes',
            :theme => 'ocean',
          },
          :categories => [{
            :category => [
              { :label => '1 star' },
              { :label => '2 stars' },
              { :label => '3 stars' },
              { :label => '4 stars' },
              { :label => '5 stars' }
            ]
          }],
          :dataset =>  [{
            :data =>  [
              { :value => @one },
              { :value => @two },
              { :value => @three },
              { :value => @four },
              { :value => @five }
            ]} ]
        }
      })
  end

  def top_dishes
  end
end

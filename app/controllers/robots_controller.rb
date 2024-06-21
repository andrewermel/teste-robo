class RobotsController < ApplicationController
    before_action :set_robot
  
    def show
    end
  
    def command
      case params[:command]
      when 'PLACE'
        x, y, direction = params[:args].split(',')
        @robot.place(x.to_i, y.to_i, direction)
      when 'MOVE'
        @robot.move
      when 'LEFT'
        @robot.left
      when 'RIGHT'
        @robot.right
      end
      redirect_to root_path
    end
  
    private
  
    def set_robot
      @robot = Robot.first_or_create
    end
  end
  
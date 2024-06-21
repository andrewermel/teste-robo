require 'rails_helper'

RSpec.describe RobotsController, type: :controller do
  before do
    @robot = Robot.create
  end

  describe 'POST #command' do
    context 'with PLACE command' do
      it 'places the robot on the table' do
        post :command, params: { command: 'PLACE', args: '0,0,NORTH' }
        @robot.reload
        expect(@robot.x).to eq(0)
        expect(@robot.y).to eq(0)
        expect(@robot.direction).to eq('NORTH')
      end
    end

    context 'with MOVE command' do
      it 'moves the robot' do
        @robot.update(x: 0, y: 0, direction: 'NORTH')
        post :command, params: { command: 'MOVE' }
        @robot.reload
        expect(@robot.y).to eq(1)
      end
    end

    context 'with LEFT command' do
      it 'rotates the robot to the left' do
        @robot.update(x: 0, y: 0, direction: 'NORTH')
        post :command, params: { command: 'LEFT' }
        @robot.reload
        expect(@robot.direction).to eq('WEST')
      end
    end

    context 'with RIGHT command' do
      it 'rotates the robot to the right' do
        @robot.update(x: 0, y: 0, direction: 'NORTH')
        post :command, params: { command: 'RIGHT' }
        @robot.reload
        expect(@robot.direction).to eq('EAST')
      end
    end
  end
end

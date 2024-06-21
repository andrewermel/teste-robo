require 'rails_helper'

RSpec.describe Robot, type: :model do
  let(:robot) { Robot.new }

  describe '#place' do
    it 'places the robot on the table' do
      robot.place(0, 0, 'NORTH')
      expect(robot.x).to eq(0)
      expect(robot.y).to eq(0)
      expect(robot.direction).to eq('NORTH')
    end

    it 'ignores invalid positions' do
      robot.place(5, 5, 'NORTH')
      expect(robot.x).to be_nil
      expect(robot.y).to be_nil
      expect(robot.direction).to be_nil
    end
  end

  describe '#move' do
    it 'moves the robot one unit forward' do
      robot.place(0, 0, 'NORTH')
      robot.move
      expect(robot.y).to eq(1)
    end

    it 'ignores move that would cause the robot to fall' do
      robot.place(0, 0, 'SOUTH')
      robot.move
      expect(robot.y).to eq(0)
    end
  end

  describe '#left' do
    it 'rotates the robot 90 degrees to the left' do
      robot.place(0, 0, 'NORTH')
      robot.left
      expect(robot.direction).to eq('WEST')
    end
  end

  describe '#right' do
    it 'rotates the robot 90 degrees to the right' do
      robot.place(0, 0, 'NORTH')
      robot.right
      expect(robot.direction).to eq('EAST')
    end
  end

  describe '#report' do
    it 'returns the position and direction of the robot' do
      robot.place(1, 2, 'EAST')
      expect(robot.report).to eq('1,2,EAST')
    end
  end
end


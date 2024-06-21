# require "test_helper"

# class RobotTest < ActiveSupport::TestCase
#   test "place robot" do
#     robot = Robot.new
#     robot.place(0, 0, 'NORTH')
#     assert_equal 0, robot.x
#     assert_equal 0, robot.y
#     assert_equal 'NORTH', robot.direction
#   end

#   test "move robot" do
#     robot = Robot.new
#     robot.place(0, 0, 'NORTH')
#     robot.move
#     assert_equal 0, robot.x
#     assert_equal 1, robot.y
#   end

#   test "rotate left" do
#     robot = Robot.new
#     robot.place(0, 0, 'NORTH')
#     robot.left
#     assert_equal 'WEST', robot.direction
#   end

#   test "rotate right" do
#     robot = Robot.new
#     robot.place(0, 0, 'NORTH')
#     robot.right
#     assert_equal 'EAST', robot.direction
#   end

#   test "report position" do
#     robot = Robot.new
#     robot.place(1, 2, 'EAST')
#     assert_equal "1,2,EAST", robot.report
#   end
# end

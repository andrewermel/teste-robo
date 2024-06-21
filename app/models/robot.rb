class Robot < ApplicationRecord
    DIRECTIONS = %w[NORTH EAST SOUTH WEST].freeze
    TABLE_SIZE = 5
  
    def place(x, y, direction)
      return unless valid_position?(x, y) && DIRECTIONS.include?(direction)
  
      self.x = x
      self.y = y
      self.direction = direction
      save
    end

    def move
      return unless placed?
    
      case direction
      when 'NORTH'
        self.y += 1 if valid_position?(x, y + 1)
      when 'EAST'
        self.x += 1 if valid_position?(x + 1, y)
      when 'SOUTH'
        self.y -= 1 if valid_position?(x, y - 1)
      when 'WEST'
        self.x -= 1 if valid_position?(x - 1, y)
      end
      save
    end

      def left
      return unless placed?
  
      self.direction = DIRECTIONS[(DIRECTIONS.index(direction) - 1) % DIRECTIONS.size]
      save
    end
  
    def right
      return unless placed?
  
      self.direction = DIRECTIONS[(DIRECTIONS.index(direction) + 1) % DIRECTIONS.size]
      save
    end
  
    def report
      return unless placed?
  
      "#{x},#{y},#{direction}"
    end
  
    private
  
    def placed?
      x.present? && y.present? && direction.present?
    end
  
    def valid_position?(x, y)
      x.between?(0, TABLE_SIZE - 1) && y.between?(0, TABLE_SIZE - 1)
    end
  end
  
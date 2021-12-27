module Rrogue
  class Tile
    def self.space
      '.'
    end
  end

	class Room
    include Enumerable
    attr_reader :height, :width

		def initialize(height, width)
	  	@width = width
      @height = height
      @rows = @height.times.map do |row|
        @width.times.map do |col|
          Tile.space
        end
      end
		end

    def put(row, col, object)
      object.row = row
      object.col = col
      @rows[row][col] = object
    end

    def at(row, col)
      @rows[row][col]
    end

    def move(object, row, col)
      return if row < 0 || row >= height || col >= width || col < 0
      current_row, current_col = find_object(object)
      @rows[current_row][current_col] = Tile.space
      put(row, col, object)
    end

    def find_object(object)
      @rows.each_with_index do |row, row_index|
        row.each_with_index do |cell, col_index|  
          return [row_index, col_index] if object == cell
        end
      end
      raise 'not found'
    end

    def each(*args, &block)
      @rows.each do |row|
        row.each do |cell|  
          yield cell
        end
      end
    end
	end
end
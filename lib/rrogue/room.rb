module Rrogue
  class Room
    include Enumerable
    attr_reader :height, :width

    def initialize(height, width)
      @width = width
      @height = height
      @rows = @height.times.map do |_row|
        @width.times.map do |_col|
          Tile.space
        end
      end
      @rows[0] = Array.new(@width) { Tile.wall }
      @rows[@height - 1] = Array.new(@width) { Tile.wall }
      @height.times do |i|
        @rows[i][0] = Tile.wall
        @rows[i][@width - 1] = Tile.wall
      end
    end

    def put(row, col, object)
      object.row = row
      object.col = col
      @rows[row][col].entity = object
    end

    def at(row, col)
      @rows[row][col]
    end

    def move(object, row, col)
      return if out_of_bounds?(row, col)
      return unless @rows[row][col].passable?

      current_row, current_col = find_object(object)
      @rows[current_row][current_col] = Tile.space
      reset_visibility(row, col)
      put(row, col, object)
    end

    def reset_visibility(row, col)
      each(&:mark_shrouded)
      at(row, col).mark_visible
      at(row, col - 1).mark_visible
      at(row, col + 1).mark_visible
      at(row - 1, col).mark_visible
      at(row + 1, col).mark_visible
    end

    def find_object(object)
      @rows.each_with_index do |row, row_index|
        row.each_with_index do |cell, col_index|
          return [row_index, col_index] if object == cell.entity
        end
      end
      raise 'not found'
    end

    def each
      @rows.each do |row|
        row.each do |cell|
          yield cell
        end
      end
    end

    private

    def out_of_bounds?(row, col)
      row < 0 || row >= height || col >= width || col < 0
    end
  end
end

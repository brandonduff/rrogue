module Rrogue
	class Room
    include Enumerable
    attr_reader :height, :width

		def initialize(height, width)
	  	@width = width
      @height = height
		end

    def each(*args, &block)
      width.times do |x|
        height.times do |y|  
          yield ''
        end
      end
    end
	end
end
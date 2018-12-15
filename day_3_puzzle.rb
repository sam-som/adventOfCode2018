require 'benchmark'
require 'pry'

class Day3Puzzle

    def fabric_with_claims
        fabric = Array.new(1000) {Array.new(1000, 0)}

        File.open("input/day_3_puzzle_input.txt").each do |line|
            specs = line.split
            id = specs[0]

            starting_coordinate = specs[2].chomp(":").split(",").map(&:to_i)
            x_coordinate = starting_coordinate[0]
            y_coordinate = starting_coordinate[1]

            width_n_height = specs[3].split("x").map(&:to_i)
            width = width_n_height[0]
            height = width_n_height[1]

            for x_pos in x_coordinate..(x_coordinate+width-1)
                for y_pos in y_coordinate..(y_coordinate+height-1)
                    fabric[x_pos][y_pos] += 1
                end
            end
        end
        
        return fabric
    end

    def calculate_overlapped_fabric
        overlapped_fabric = 0;

        fabric_with_claims.each do |row|
            row.each do |column|
                if(column>1)
                    overlapped_fabric += 1
                end
            end
        end
        
        return overlapped_fabric
    end

    def find_intact_fabric(fabric)
        File.open("input/day_3_puzzle_input.txt").each do |line|
            specs = line.split
            id = specs[0]

            starting_coordinate = specs[2].chomp(":").split(",").map(&:to_i)
            x_coordinate = starting_coordinate[0]
            y_coordinate = starting_coordinate[1]

            width_n_height = specs[3].split("x").map(&:to_i)
            width = width_n_height[0]
            height = width_n_height[1]

            claim_sum = 0

            for x_pos in x_coordinate..(x_coordinate+width-1)
                for y_pos in y_coordinate..(y_coordinate+height-1)
                    claim_sum += fabric[x_pos][y_pos]
                end
            end
            if (claim_sum == width*height)
                return id
            end
        end
    end

    ans = Day3Puzzle.new
    # Part 1
    puts ans.calculate_overlapped_fabric
    puts Benchmark.measure {ans.calculate_overlapped_fabric}

    # Part 2
    puts ans.find_intact_fabric(ans.fabric_with_claims)
    puts Benchmark.measure {ans.find_intact_fabric(ans.fabric_with_claims)} 
end
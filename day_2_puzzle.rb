require 'benchmark'

class Day2Puzzle
    def checksum()
        numOf2 = 0
        numOf3 = 0

        File.open("input/day_2_puzzle_input.txt").each do |line|
            abc_hash = Hash.new 0
            line.each_char { |c|
                abc_hash[c] += 1
            }

            found2 = false
            found3 = false
            abc_hash.each_value do |value|
                break if found2 && found3
                if value == 2 && !found2
                    numOf2 += 1
                    found2 = true
                elsif value == 3 && !found3
                    numOf3 += 1
                    found3 = true
                end
            end
        end
        puts "number of 2 char occurance " + numOf2.to_s
        puts "number of 3 char occurance " + numOf3.to_s
        puts "checksum is : " + (numOf2 * numOf3).to_s
    end

    def isOffByOne(str1, str2)
        diffAllow = 1
        for position in 0..str1.length
            break unless diffAllow >= 0
            if str1[position] != str2[position]
                diffAllow -= 1
            end
        end
    
        if diffAllow == 0 
            return true
        else
            return false
        end
    end
    
    def findOffByOneBoxes()
        ids = []
        File.open("input/day_2_puzzle_input.txt").each do |line|
            ids << line
        end
        
        for current_id in 0..ids.length-1
            for candidate_id in current_id+1..ids.length-1
                if(isOffByOne(ids[current_id], ids[candidate_id]))
                    puts ids[current_id] + ids[candidate_id]
                    return
                end
            end
        end
    end
end

#Part 1
puts Benchmark.measure {Day2Puzzle.new.checksum}
#Part 2
puts Benchmark.measure {Day2Puzzle.new.findOffByOneBoxes()}
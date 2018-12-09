class Day1Puzzle
    def frequencyFinder()
        currentFrequency = 0
        File.open("input/day_1_puzzle_1.txt").each do |line|
            currentFrequency += line.to_i
        end
        puts currentFrequency
    end

    def repeatFinder()
        knownFrequencies = [0]
        currentFrequency = 0
        while true
            File.open("input/day_1_puzzle_1.txt").each do |line|
                currentFrequency += line.to_i
                if(knownFrequencies.include? currentFrequency)
                    puts "First repeat frequency is " + currentFrequency.to_s
                    return
                else
                    knownFrequencies << currentFrequency
                end
            end
        end
    end
end

# create Day1Puzzle object
# Day1Puzzle.new.frequencyFinder
# Day1Puzzle.new.repeatFinder()

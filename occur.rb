# Accepts a file from STDIN in terminal, pushes to "row" array
row = []
File.open(ARGV.first, "r") do |f|
	f.each_line do |line|
	  sentence = line.chomp.split(",") 		
	  row.push(sentence)
	end
end

row_dup = row.dup		# Non-destructive object duplication

# Creates a hash of a all possible company pairs sorted by row
pair_combinations = {}
num = 0

row_dup.each do |row|
	num += 1
	row_number = "row_" + num.to_s
	combo_row = row.combination(2).to_a
	pair_combinations[row_number] = combo_row
end

pair_array = pair_combinations.dup 
pair_array2 = pair_array.dup

cooccurences 	= {}
row_counter 	= 0

line = 0

for row in pair_array	# Row of pairs [[Company, Company],[Company, Company]]
	
	row_counter += 1

	for pair in pair_array["row_#{row_counter}"] 	# Single Pair [Company, Company]
				 n = 0
		row_count2 = 0

		for row in pair_array2
			row_count2 += 1
			if pair_array["row_#{row_count2}"].include? pair
				n += 1
			end
		end
		puts 'Process'
		line = line + 1
		puts line
		cooccurences = {:companies=>pair, :happened=>n}
		puts cooccurences
	end
	
end


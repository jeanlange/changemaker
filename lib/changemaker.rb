require 'bigdecimal'

class ChangeMaker
    def make_change total_as_float
        # we use BigDecimal to deal with rounding errors
        total = BigDecimal(total_as_float.to_s)

        # set up a set of counters that covers each coin
        counters = [
            {
                name: "hundos",
                value: BigDecimal("100.0"), 
                singular: "hunda",
                count: 0
            },    
            {
                name: "fiddies",
                value: BigDecimal("50.0"), 
                singular: "fiddy",
                count: 0
            },
            {
                name: "twenties",
                value: BigDecimal("20.0"), 
                singular: "twenty",
                count: 0
            },
            {
                name: "tens",
                value: BigDecimal("10.0"), 
                singular: "ten",
                count: 0
            },    
            {
                name: "fives",
                value: BigDecimal("5.0"), 
                singular: "five",
                count: 0
            },
            {
                name: "dollars",
                value: BigDecimal("1.0"), 
                singular: "dollar",
                count: 0
            },
            {
                name: "quarters",
                value: BigDecimal("0.25"), 
                singular: "quarter",
                count: 0
            },
            {
                name: "dimes",
                value: BigDecimal("0.10"), 
                singular: "dime",
                count: 0
            },
            {
                name: "nickels",
                value: BigDecimal("0.05"), 
                singular: "nickel",
                count: 0
            },
            {
                name: "pennies",
                value: BigDecimal("0.01"), 
                singular: "penny",
                count: 0
            }
        ]

        # subtract biggest possible coin and add to counter repeatedly
        counters.each do |coin|
            while total >= coin[:value]
                total = total - coin[:value]
                coin[:count] = coin[:count] + 1
            end
        end

        answer = ""
        # construct answer based on counters
        counters.each do |coin|
            # if there's already something in answer
            # and I'm about to add something else
            # then add a ', '
            if answer != "" && coin[:count] > 0
                answer << ", "
            end

            if coin[:count] > 1
                answer << "#{coin[:count]} #{coin[:name]}"
            elsif coin[:count] == 1
                answer << "1 #{coin[:singular]}"
            end
        end

        # deal with no change
        if answer == ""
            answer << "No change!"
        end
        return answer
    end
end
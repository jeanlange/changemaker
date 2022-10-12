# tests!
# [x] true == true
# [x] pennies 1-4 - interesting? 1. 4.
# [x] 0 things - no change?
# test for each denomination - nickels, dimes, quarters, dollars, fives, 10s...
## [x] 1 nickel
## 1 nickel and 1 penny
## [x] 2 dimes
## 1 dollar
## 2 dollars
## 5 dollars
## some big test that does them all.
# the change is .27 - 1 quarter and 2 pennies
# [ ] something that shows the rounding error problems

require 'changemaker'

describe "my cool cash register" do
    let(:my_register) { ChangeMaker.new }

    it "can deal with no change" do
        change = my_register.make_change(0)
        expect(change).to eql("No change!")
    end

    context "pennies" do
        it "can deal with one penny" do
            change = my_register.make_change(0.01)
            expect(change).to eql("1 penny")
        end

        it "can deal with 3 pennies" do
            change = my_register.make_change(0.03)
            expect(change).to eql("3 pennies")
        end

        # it "can deal with 500 pennies" do
        #     change = my_register.make_change(5)
        #     expect(change).to eql("500 pennies")
        # end
    end

    context "nickels" do
        it "can deal with 1 nickel" do
            change = my_register.make_change(0.05)
            expect(change).to eql("1 nickel")
        end
    end

    context "dimes" do
        it "can deal with 1 dime" do
            change = my_register.make_change(0.10)
            expect(change).to eql("1 dime")
        end
        
        it "can deal with 2 dimes" do
            change = my_register.make_change(0.20)
            expect(change).to eql("2 dimes")
        end
    end

    context "more than one type of coin" do
        it "can deal with 12 cents (some of 2 denominations, none of one in the middle, both plural and singular)" do
            change = my_register.make_change(0.12)
            expect(change).to eql("1 dime, 2 pennies")
        end
    end
end
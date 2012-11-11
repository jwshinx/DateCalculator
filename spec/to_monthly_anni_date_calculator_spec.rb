require 'spec_helper'

describe "ToMonthlyAnniDateCalculator" do
 describe "of customer with anniversary date of today" do
  before do
   @system = double 'system', :name => '123 Main Street'
   @invoice = double 'invoice', :TxnDate => Date.today
   @customer = double 'customer', :Name => 'Huck Finn', :invoices => [@invoice]

   customer_invoices = @customer.invoices
   def customer_invoices.order arg 
    [@invoice] 
   end

   @subscription = double 'subscription', :anniversary_date => Date.today, :customer => @customer
   #@most_recent_invoice = double 'invoice', :TxnDate => Date.today
   
  end
  it "xxx" do
   calculator = ToMonthlyAnniDateCalculator.new @system, @subscription
   new_date = calculator.calculate_new_anni_date
   new_date.should == Date.today
  end
 end
end

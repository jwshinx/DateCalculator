class ToMonthlyAnniDateCalculator
 #include Dateable

 attr_reader :customer, :system, :current_sub, :most_recent_invoice

 def initialize system, current_sub
  @system = system
  @current_sub = current_sub
  @customer = current_sub.customer
  @most_recent_invoice = @customer.invoices.order('TxnDate desc').first
 end
 def calculate_new_anni_date
  Date.today
=begin
  #current_anniversary_date = @current_sub.anniversary_date
  if is_beyond_two_months_of @most_recent_invoice.TxnDate.to_date
   today = Date.today
   #(current_anniversary_date.month > today.month && current_anniversary_date.day > today.day) ? x = 0 : x = 1
   #Date.new( (today+x.years).year, current_anniversary_date.month, current_anniversary_date.day)
   Date.today
  elsif is_beyond_one_month_of @most_recent_invoice.TxnDate.to_date
   #@most_recent_invoice.TxnDate.to_date
   Date.today
  else
   #@most_recent_invoice.TxnDate.to_date
   Date.today
  end
=end
 #rescue Exception => exc # invalid date
  #Rails.logger.error "---> ToMonthlyWithTwoMonthsRuleAnniDateCalculator date invalid error: #{@customer.Name}"
  #Date.new( (today+x.years).year, (current_anniversary_date+1.month).month, 1)
 end
 def calculate_new_start_auto_invoicing_date
  #calculate_new_anni_date+1.month
  if is_beyond_two_months_of @most_recent_invoice.TxnDate.to_date
   calculate_new_anni_date # same as anni-date
  elsif is_beyond_one_month_of @most_recent_invoice.TxnDate.to_date
   (@most_recent_invoice.TxnDate+2.month).to_date
  else
   (@most_recent_invoice.TxnDate+1.month).to_date
  end
 end
 def is_beyond_two_months_of date 
  Date.today > date+2.months
 end
 def is_beyond_one_month_of date 
  Date.today > date+1.months
 end
end


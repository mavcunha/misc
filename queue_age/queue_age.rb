#########################
## total por mes
@total = [
  0.00,
  28_025.81,
  7_342_762.97,
  11_210_325.14,
  10_986_118.64,
  8_828_131.05,
  8_828_131.05,
  8_828_131.05,
  8_828_131.05,
  8_828_131.05,
  8_828_131.05,
  8_828_131.05
]
##
########################

month = [@total[0]]

def f_month(m)
  m.dup.fill(0,m.length...@total.length).map { |e| "%.2f" % e }
end

puts "total: %12.2f months: %s" % [@total[0], f_month(month)]

@total.take(@total.length - 1).each_index do |i|
  diff = @total[i+1] - @total[i]

  if diff >= 0
    month.unshift diff
  else
    month.unshift 0

    month.each_index.reverse_each do |i|
      diff+=month[i]

      if diff >= 0
        month[i] = diff
        break
      else
        month[i] = 0
      end
    end
  end

  puts "total: %12.2f months: %s" % [@total[i + 1], f_month(month)]
end

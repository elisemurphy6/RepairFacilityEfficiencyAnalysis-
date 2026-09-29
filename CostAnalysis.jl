## Second mechanic vs cost of replacement forklifts  
# Parameters 
λ = 4.9 
μ = 7.3     
N = 27 

w1 = zeros(N + 1) 
w1[1] = 1 

for i in 1:N 
    w1[i + 1] = w1[i] * λ / μ 
end 
P1 = w1 / sum(w1, dims=1) 
replacement_cost = 25 * sum((i-1)* P1[i+1] for i in 2:N) 

w2 = zeros(N + 1) 
w2[1] = 1 
for i in 1:N 
    service_rate = min(i, 2) * μ 
    w2[i + 1] = w2[i] * λ / service_rate 
end  
P2 = w2 / sum(w2, dims=1) 
prob_2nd_mechanic_called = sum(P2[3:end]) 
second_mechanic_cost = 250 * prob_2nd_mechanic_called 

println("The expected cost of leasing replacement forklifts is: \$", round(replacement_cost, digits=2)) 
println("The expected cost of having a second mechanic is: \$", round(second_mechanic_cost, digits=2)) 

if second_mechanic_cost < replacement_cost  
    println("It is more cost-effective to have a second mechanic.") 
else 
    println("It is more cost-effective to lease replacement forklifts.") 
end

#= Output
The expected cost of leasing replacement forklifts is: $34.25
The expected cost of having a second mechanic is: $42.17
It is more cost-effective to lease replacement forklifts.
=# 


## When does leasing become more cost-effective than hiring a second mechanic? 
# Parameters 
λ = 4.9 
μ = 7.3 
N = 27 

w1 = zeros(N + 1) 
w1[1] = 1 
for i in 1:N 
    w1[i + 1] = w1[i] * λ / μ 
end 
P1 = w1 / sum(w1, dims=1) 
replacement_cost = 25 * sum((i-1)* P1[i+1] for i in 2:N) 

w2 = zeros(N + 1) 
w2[1] = 1 
for i in 1:N 
    service_rate = min(i, 2) * μ 
    w2[i + 1] = w2[i] * λ / service_rate 
end 
P2 = w2 / sum(w2, dims=1) 
prob_2nd_mechanic_called = sum(P2[3:end]) 

break_even_cost = replacement_cost / prob_2nd_mechanic_called 

println("Leasing cost = \$", round(replacement_cost, digits=2)) 
println("Probability of second mechanic being called = ", round(round(prob_2nd_mechanic_called, digits=3) * 100, digits=2), "%") 
println("The break-even cost for second mechanic cost: \$", round(break_even_cost, digits=2)) 

#= Output
Leasing cost = $34.25
Probability of second mechanic being called = 16.9%
The break-even cost for second mechanic cost: $203.07
=#

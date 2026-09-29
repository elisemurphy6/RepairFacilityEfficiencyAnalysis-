## Additional mechanic when 2 or more forklifts are in the repair facility matrix and steady state probabilities 
using LinearAlgebra 
# Parameters
λ = 4.9 
μ = 7.3 
N = 27 

weights = zeros(N + 1) 
weights[1] = 1  

for i in 1:N  
    if i == 1 
        weights[i + 1] = weights[1] * λ/μ 
    else 
        weights[i + 1] = weights[i] * λ/(2*μ) 
    end 
end  

Ptilde = weights / sum(weights, dims=1) 
println("Sum of steady state probabilities: ", round(sum(Ptilde), digits=12)) 

for i in 0:N 
    println("P[$i] = ", round(Ptilde[i + 1], digits=6)) 
end 

#= Output
Sum of steady state probabilities: 1.0
P[0] = 0.497436
P[1] = 0.333895
P[2] = 0.112061
P[3] = 0.037609
P[4] = 0.012622
P[5] = 0.004236
P[6] = 0.001422
P[7] = 0.000477
P[8] = 0.00016
P[9] = 5.4e-5
P[10] = 1.8e-5
P[11] = 6.0e-6
P[12] = 2.0e-6
P[13] = 1.0e-6
P[14] = 0.0
P[15] = 0.0
P[16] = 0.0
P[17] = 0.0
P[18] = 0.0
P[19] = 0.0
P[20] = 0.0
P[21] = 0.0
P[22] = 0.0
P[23] = 0.0
P[24] = 0.0
P[25] = 0.0
P[26] = 0.0
P[27] = 0.0
=#


## Expected number of forklifts in the repair facility, probability that first mechanic is busy, second mechanic is called in, and probability there are 5 or more forklifts in the repair facility 
# Parameters
λ = 4.9 
μ = 7.3 
N = 27 

weights = zeros(N + 1) 
weights[1] = 1 

for i in 1:N 
    service_rate = min(i, 2) * μ 
    weights[i + 1] = weights[i] * λ / service_rate 
end 

p = weights / sum(weights, dims=1) 
EX = sum(i * p[i + 1] for i in 0:N) 

prob_first_mechanic_busy = sum(p[i + 1] for i in 1:N) 
prob_second_mechanic_called = sum(p[i + 1] for i in 2:N) 
prob_5_or_more = sum(p[i + 1] for i in 5:N) 

println("The expected number of forklifts in the repair facility is: ", round(EX, digits=2), " forklifts") 
println("The probability that the first mechanic is busy is: ", round(round(prob_first_mechanic_busy, digits=4) * 100, digits=2), "%") 
println("The probability that the second mechanic is called in is: ", round(round(prob_second_mechanic_called, digits=4) * 100, digits=2), "%") 
println("The probability that there are 5 or more forklifts in the repair facility is: ", round(round(prob_5_or_more, digits=4) * 100, digits=2), "%") 

#= Output: 
The expected number of forklifts in the repair facility is: 0.76 forklifts
The probability that the first mechanic is busy is: 50.26%
The probability that the second mechanic is called in is: 16.87%
The probability that there are 5 or more forklifts in the repair facility is: 0.64%
=#

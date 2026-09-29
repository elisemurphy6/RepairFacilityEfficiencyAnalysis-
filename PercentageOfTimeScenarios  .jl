## Percentage of P(Xi = 0) of time the mechanic doesn't have to work 
# Parameters 
λ = 4.9 
μ = 7.3 
N = 27 

p = λ / μ 
P0 = (1 - p) / (1 - p^(N + 1)) 
NB = P0 * 100 
println("The percentage of time the mechanic has no work to do is: ", round(NB, digits=2), "%")  

# Output: "The percentage of time the mechanic has no work to do is: 32.88%"


## Part iii : Expected queue length of forklifts in repair facility  
# Parameters 
λ = 4.9 
μ = 7.3 
N = 27 

p = λ / μ 
P0 = (1 - p) / (1 - p^(N + 1)) 
P = [P0 * p^i for i in 0:N] 
EX = sum(i * P[i + 1] for i in 0:N) 
println("Expected queue length of forklifts in repair facility: ", round(EX, digits=2), " forklifts") 

# Output: "Expected queue length of forklifts in repair facility: 2.04 forklifts"  


## Percentage of time there are 5 or more forklifts in the repair facility 
# Parameters 
λ = 4.9 
μ = 7.3 
N = 27 

p = λ / μ 
P0 = (1 - p) / (1 - p^(N + 1)) 
P = [P0 * p^i for i in 0:N] 
percentage_5_or_more = sum(P[i + 1] for i in 5:N) * 100 

println("Percentage of time there are 5 or more forklifts in the repair facility: ", round(percentage_5_or_more, digits=2), "%") 

# Output: "Percentage of time there are 5 or more forklifts in the repair facility: 13.62%" 

# RepairFacilityEfficiencyAnalysis-
This project analyzes a finite-population forklift repair system using queueing theory and Julia. It evaluates the behavior and cost of operating with one mechanic versus calling in a second mechanic when two or more forklifts are in the repair facility.
## Model Parameters

- **Arrival rate ($\lambda$):** 4.9 forklifts per time period
- **Service rate per mechanic ($\mu$):** 7.3 forklifts per time period
- **Fleet size ($N$):** 27 forklifts

## Analyses Included

- Percentage of time the mechanic is idle.
- Expected number of forklifts in the repair facility.
- Probability that five or more forklifts are in the repair facility.
- Steady-state probabilities when a second mechanic is added.
- Probability that the first mechanic is busy and the second mechanic is called.
- Cost comparison between hiring a second mechanic and leasing replacement forklifts.
- Break-even cost at which the preferred option changes.

## Requirements

- Julia
- The Julia standard-library package `LinearAlgebra`

**Note:** The calculations assume constant arrival and service rates and a maximum population of 27 forklifts. Update λ, μ, N, and the cost values in the script to test other operating scenarios.

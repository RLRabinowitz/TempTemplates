package env0

cost_threshold := 20
upper_threshold := cost_threshold * 0.75

allow contains msg if {
    input.costEstimation.totalMonthlyCost <= cost_threshold
    msg := "This has been allowed, the estimated cost is below the upper threshold"
}

warn contains msg if {
    input.costEstimation.totalMonthlyCost > upper_threshold
    input.costEstimation.totalMonthlyCost <= cost_threshold
    msg := "This has been allowed, the estimated cost is below the cost threshold"
}

pending contains msg if {
    input.costEstimation.totalMonthlyCost > cost_threshold
    msg := "This is pending, as the cost is over the cost threshold"
}

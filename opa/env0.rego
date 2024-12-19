package env0

# METADATA
# title: Require Approval
# description: require 1 approval different than deployer
pending[format(rego.metadata.rule())] {
    count([email | email := input.approvers[_].email; email != input.deployerUser.email]) < 1
}

# METADATA
# title: Allow if approved by different user
# description: allow if approved by someone other than the deployer
pending[format(rego.metadata.rule())] {
    count([email | email := input.approvers[_].email; email != input.deployerUser.email]) >= 1
}


format(meta) := meta.description

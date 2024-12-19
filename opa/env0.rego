package env0

# METADATA
# title: Require Approval
# description: require 1 approval different than deployer
pending[format(rego.metadata.rule())] {
    count([email | email := input.approvers[_].email; email != input.deployerUser.email]) < 1
}

package env0

# METADATA
# title: allow pending
# description: always require approval
pending[format(rego.metadata.rule())]

format(meta) := meta.description

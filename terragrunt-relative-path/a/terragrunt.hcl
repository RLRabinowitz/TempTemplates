locals {
  _ = run_cmd("sh", "-c", <<EOF
    echo in parent: ${get_path_to_repo_root()}
    echo in parent: ${get_path_from_repo_root()}
  EOF
  )
}

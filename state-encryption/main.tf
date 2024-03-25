variable "passphrase" {
}

terraform {
  encryption {
    key_provider "pbkdf2" "foo" {
      passphrase = "codededucodededu"
    }

    method "aes_gcm" "bar" {
      keys = key_provider.pbkdf2.foo
    }

    state {
      method = method.aes_gcm.bar
      fallback {
        # The empty fallback block allows reading unencrypted state files.
      }
    }

    plan {
      method = method.aes_gcm.bar
      fallback {
        # The empty fallback block allows reading unencrypted state files.
      }
    }
  }
}

resource "null_resource" "nully" {
}

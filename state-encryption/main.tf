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
      #method = method.aes_gcm.bar
      fallback {
        method = method.aes_gcm.bar
      }
    }

    plan {
      #method = method.aes_gcm.bar
      fallback {
        method = method.aes_gcm.bar
      }
    }
  }
}

resource "null_resource" "nully" {
}

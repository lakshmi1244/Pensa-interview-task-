terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.1"
    }
  }
}

provider "local" {
  # no configuration needed
}

locals {
  all_objects = flatten([
    for env, subenvs in var.environments : [
      for subenv, parent_objects in subenvs : [
        for parent, objects in parent_objects : [
          for obj in objects : {
            name   = obj.name
            env    = env
            subenv = subenv != "" ? subenv : null
            type   = obj.type
            parent = parent != "" ? parent : null
            params = obj.params
          }
        ]
      ]
    ]
  ])
}

resource "local_file" "terraform_data_objects" {
  count    = length(local.all_objects)
  filename = "${local.all_objects[count.index].name}.json"
  content  = jsonencode(local.all_objects[count.index])
}

output "object_files" {
  value = [for f in local_file.terraform_data_objects : f.filename]
}


terraform {
  
  backend "local" {}
  
  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "3.2.1"
    }
  }
  required_version = ">= 0.14.0"
}


locals {
  test1   = var.itest1
  test2   = var.itest2
  test3   = var.itest3
  test4   = var.itest4
  testall = join(", ", [var.itest1, var.itest2, var.itest3, var.itest4])
}

resource "null_resource" "create" {
  provisioner "local-exec" {
    command     = "echo start apply!!; echo $ID; sleep 1; echo $TEST1; sleep 1; echo $TEST2; sleep 1; echo $TEST3; sleep 1; echo $TEST4; sleep 1; echo apply done!!!!"
    interpreter = ["/bin/sh", "-c"]

    environment = {
      ID    = self.id
      TEST1 = local.test1
      TEST2 = local.test2
      TEST3 = local.test3
      TEST4 = local.test4
    }

    when = create
  }
}

resource "null_resource" "destroy" {
  provisioner "local-exec" {
    command     = "echo start destroy!!; echo $ID; sleep 1; echo destroy done!!!!"
    interpreter = ["/bin/sh", "-c"]

    when = destroy

    environment = {
      ID = self.id
    }
  }
}


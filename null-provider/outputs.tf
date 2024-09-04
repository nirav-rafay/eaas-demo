output "otest1" {
  value = local.test1
}

output "otest2" {
  value = local.test2
}

output "otest3" {
  value = local.test3
}

output "otest4" {
  value = local.test4
}

output "otestall" {
  value = local.testall
}

output "create_id" {
  value = null_resource.create.id
}

output "destroy_id" {
  value = null_resource.destroy.id
}
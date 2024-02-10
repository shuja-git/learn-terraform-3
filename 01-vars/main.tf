output "sample1" {
  value = var.sample1
}
output "list" {
  value = var.sample_list.*
}
output "list_of_maps" {
  value = var.list_of_map.*.course_name
}
resource "random_pet" "bucket_name" {
  length = 3
}

output "random_pet_name" {
  value = random_pet.bucket_name.id
}
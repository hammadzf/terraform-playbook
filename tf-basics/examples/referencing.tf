resource "random_string" "str" {
  length = 10
}

resource "random_integer" "num" {
  max = 5
  min = 1
}

resource "local_file" "test_file" {
  filename = "./test.txt"
  content = "The value of the random integer is ${random_integer.num.id}.\nThe value of random string is ${random_string.str.id}.\n"
}
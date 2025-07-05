resource "aws_instance" "django_server"{
    ami = var.ami_id
}
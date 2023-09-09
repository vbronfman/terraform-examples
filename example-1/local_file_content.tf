locals   {
    filename = "/tmp/file-to-delete"
    lines = [ for line in  random_string.my_random_string.*.result : "Next ${line}" ] 
    count = 12
}

resource "local_file" "mylocalfile" {
  filename = local.filename
  content = <<-EOF
     echo File content created
  EOF
}


resource "local_file" "random_content" {
  filename="/tmp/random-content"
    // content =  join("   \n",local.lines)
    // same as %{for line in random_string.my_random_string.*.result }
    content = <<-EOF
      %{for line in random_string.my_random_string[*].result } 
      line ${line}
      %{endfor}
EOF

  provisioner "local-exec" {
     command = "echo ${self.filename} >> /tmp/private_ips.txt"
  }

}

output "lines" {
    value = local_file.random_content
    sensitive = true
}

resource "random_string" "my_random_string" {
  length  = 33
  special = false
  upper   = false
  count=local.count
}

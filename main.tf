resource "github_repository" "repo" {
  name        = var.repository_name
  description = var.repository_description

  visibility = "public"

}

resource "null_resource" "git_push" {
  depends_on = [github_repository.repo]

  provisioner "local-exec" {
    command = "echo Initializing git repository... && git init && echo # ${var.repository_name} > README.md && git add . && git commit -m \"Initial-commit\" && git remote add origin ${github_repository.repo.git_clone_url} && git branch -M main && git push -u origin main"



    # Define the working directory for the command execution
    working_dir = path.module

    # Set up interpreter (use bash for Linux/macOS, PowerShell for Windows)
    interpreter = ["cmd", "/C"]

    # Quiet mode is false, so commands will be printed to the output for debugging
    quiet = false
  }
}
$repos = Invoke-RestMethod -Uri "https://api.github.com/users/<user>/repos"

$repos.clone_url | ForEach-Object -Parallel {
    git clone $_
} -ThrottleLimit 10 

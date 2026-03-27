# Mapping of commit hashes to new messages
$commitMessages = @{
    "b6d6969" = "Initial commit"
    "5effcac" = "Set up deployment configuration"
    "f1aee8a" = "Remove deprecated MySQL8Dialect"
    "4226960" = "Fix 404 routing on Vercel"
    "9f21e20" = "Fix SPA routing with vercel.json"
    "d6bec02" = "Update Vercel rewrite rules"
    "7d6f27f" = "Use Vercel Vite preset"
    "f7a25a9" = "Add GitHub Pages workflow"
    "d3005df" = "Fix CI build issues"
    "4d410c2" = "Deploy to gh-pages"
    "bd8da45" = "Update API endpoint"
    "6f9bfc9" = "Add database seeder"
    "1b3ac41" = "Fix DataSeeder user field"
}

# Create temporary editor script
$editorScript = @"
`$commit_hash = `$args[0]
`$content = Get-Content `$args[1]
`$lines = `$content -split "`n"

# Replace first line with new message if it exists in our map
foreach (`$hash in `$commitMessages.Keys) {
    if (`$lines[0] -match "^(?:\w+\s+)?`$hash\s+(.*)") {
        `$lines[0] = `$commitMessages[`$hash]
        break
    }
}

Set-Content `$args[1] (`$lines -join "`n")
"@

# Start interactive rebase from root
Write-Host "Starting interactive rebase. This will ask you to edit each commit message..."
Write-Host "Messages will be automatically updated based on the mapping."

cd "c:\Users\ASUS\Desktop\Spring Boot\Local Resolve"
git rebase -i --root

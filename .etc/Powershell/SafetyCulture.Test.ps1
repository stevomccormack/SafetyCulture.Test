#-----------------------------------------------------------------------------------------------------------------------
. "E:\Steve McCormack\Workspaces\GitHub\SafetyCulture\SafetyCulture.Test\etc\Powershell\_variables.ps1"
#-----------------------------------------------------------------------------------------------------------------------

#-----------------------------------------------------------------------------------------------------------------------
# Check .NET versions
#-----------------------------------------------------------------------------------------------------------------------
dotnet --list-sdks
dotnet --list-runtimes


#-----------------------------------------------------------------------------------------------------------------------
# Install Packages
#-----------------------------------------------------------------------------------------------------------------------
Push-Location $SafetyCulture.ProjectDirectory

# dotnet add package ...

Pop-Location



#-----------------------------------------------------------------------------------------------------------------------
# Restore and Build Solution
#-----------------------------------------------------------------------------------------------------------------------
Push-Location $SafetyCulture.SolutionDirectory

dotnet clean
dotnet restore
dotnet build  --no-restore

Pop-Location

#-----------------------------------------------------------------------------------------------------------------------
# Run Tests
#-----------------------------------------------------------------------------------------------------------------------
Push-Location $SafetyCulture.TestProjectDirectory

dotnet test --logger "console;verbosity=detailed"

Pop-Location



#-----------------------------------------------------------------------------------------------------------------------
# Test SSH Connection
# Hi stevomccormack! You've successfully authenticated, but GitHub does not provide shell access.
#-----------------------------------------------------------------------------------------------------------------------

ssh -T git@github.com

#-----------------------------------------------------------------------------------------------------------------------
# Init repository
#-----------------------------------------------------------------------------------------------------------------------

Push-Location $SafetyCulture.RootPath

git config --global --add safe.directory $SafetyCulture.RootPath

# Init repository
git init

# Local config
git config user.name $Git.UserName
git config user.email $Git.UserEmail
git config --local --list

# Global config
git config --global core.editor "code --wait"

#-----------------------------------------------------------------------------------------------------------------------
# Create main branch for new repository
#-----------------------------------------------------------------------------------------------------------------------
$mainBranchExists = git branch --list $Git.BranchMain
if (-not $mainBranchExists) {

    # Create main - with empty commit
    git commit --allow-empty -m "Create main branch - empty commit"

    # Create main - with existing files
    git branch -M $Git.BranchMain
    git remote add $Git.Origin $Git.OriginUrl
    git remote -v
    git push  $Git.Origin $Git.BranchMain -u
}
else {
    Write-Host "Main branch already exists."
}

#-----------------------------------------------------------------------------------------------------------------------
# Push files to repository
#-----------------------------------------------------------------------------------------------------------------------   
git add .
git commit -m "Completed test files"
git push -u $Git.Origin $Git.BranchMain


Pop-Location



#-----------------------------------------------------------------------------------------------------------------------
# Mistake Handling
#-----------------------------------------------------------------------------------------------------------------------
Push-Location $SafetyCulture.RootPath

# if just created .gitignore - add it.
git add .gitignore
git commit -m ".gitignore"
git push $Git.Origin $Git.BranchMain

# Remove a specific file from the repository (mistakes!)
# git rm --cached <file-path>

# Remove all files as per .gitignore    
git rm -r --cached .
git add .
git commit -m "Remove accidentally pushed files"
git push $Git.Origin $Git.BranchMain


Pop-Location



# -----------------------------------------------------------------------------------------------------------------------   
# Big O Time Complexities    
# -----------------------------------------------------------------------------------------------------------------------   
# O(1)	        Constant time:          Doesn't grow with input size	            Accessing an element in an array
# O(log n)	    Logarithmic time:       Reduces problem size logarithmically	    Binary search
# O(n)	        Linear time:            Grows directly with input size	            Iterating through an array
# O(n log n)	Linearithmic time:      Combines linear and logarithmic growth	    Merge sort, quicksort (average case)
# O(n²)	        Quadratic time:         Grows quadratically with input size	        Nested loops
# O(2^n)	    Exponential time:       Doubles with each input addition	        Recursive Fibonacci


$SafetyCulture = [pscustomobject]@{
    RootPath = "E:\Steve McCormack\Workspaces\GitHub\SafetyCulture\SafetyCulture.Test"
    SolutionPath = "$($SafetyCulture.RootPath)\SafetyCulture.Test.sln"
    ProjectDirectory = "$($SafetyCulture.RootPath)\SafetyCulture.Functions"
    ProjectPath = "$($SafetyCulture.ProjectDirectory)\SafetyCulture.Functions.csproj"
    TestProjectDirectory = "$($SafetyCulture.RootPath)\SafetyCulture.Functions.Tests"
    TestProjectPath = "$($SafetyCulture.TestProjectDirectory)\SafetyCulture.Functions.Tests.csproj"
}

$Git = [pscustomobject]@{
    OriginUrl = "git@github.com:stevomccormack/SafetyCulture.Test.git"
    Origin = "origin"
    UserName = "Steve McCormack"
    UserEmail = "hello@iamstevo.co"
    BranchMain = "main"
}

$GitHub = [pscustomobject]@{    
    Repo = "SafetyCulture.Test"
    Owner = "stevomccormack"
}


#-----------------------------------------------------------------------------------------------------------------------
# Displaying Variables and Paths
#-----------------------------------------------------------------------------------------------------------------------

Write-Host "-----------------------------------------------------------------------------------------------" -ForegroundColor Yellow
Write-Host "SafetyCulture Configuration:" -ForegroundColor Yellow
Write-Host "-----------------------------------------------------------------------------------------------" -ForegroundColor Yellow
Write-Host "`$SafetyCulture.RootPath: " -ForegroundColor Green -NoNewline; Write-Host "$($SafetyCulture.RootPath)" -ForegroundColor White
Write-Host "`$SafetyCulture.SolutionPath: " -ForegroundColor Green -NoNewline; Write-Host "$($SafetyCulture.SolutionPath)" -ForegroundColor White
Write-Host "`$SafetyCulture.ProjectDirectory: " -ForegroundColor Green -NoNewline; Write-Host "$($SafetyCulture.ProjectDirectory)" -ForegroundColor White
Write-Host "`$SafetyCulture.ProjectPath: " -ForegroundColor Green -NoNewline; Write-Host "$($SafetyCulture.ProjectPath)" -ForegroundColor White
Write-Host "`$SafetyCulture.TestProjectDirectory: " -ForegroundColor Green -NoNewline; Write-Host "$($SafetyCulture.TestProjectDirectory)" -ForegroundColor White
Write-Host "`$SafetyCulture.TestProjectPath: " -ForegroundColor Green -NoNewline; Write-Host "$($SafetyCulture.TestProjectPath)" -ForegroundColor White

Write-Host "-----------------------------------------------------------------------------------------------" -ForegroundColor Yellow
Write-Host "Git Configuration:" -ForegroundColor Yellow
Write-Host "-----------------------------------------------------------------------------------------------" -ForegroundColor Yellow
Write-Host "`$Git.OriginUrl: " -ForegroundColor Green -NoNewline; Write-Host "$($Git.OriginUrl)" -ForegroundColor White
Write-Host "`$Git.Origin: " -ForegroundColor Green -NoNewline; Write-Host "$($Git.Origin)" -ForegroundColor White
Write-Host "`$Git.UserName: " -ForegroundColor Green -NoNewline; Write-Host "$($Git.UserName)" -ForegroundColor White
Write-Host "`$Git.UserEmail: " -ForegroundColor Green -NoNewline; Write-Host "$($Git.UserEmail)" -ForegroundColor White
Write-Host "`$Git.BranchMain: " -ForegroundColor Green -NoNewline; Write-Host "$($Git.BranchMain)" -ForegroundColor White

Write-Host "-----------------------------------------------------------------------------------------------" -ForegroundColor Yellow
Write-Host "GitHub Configuration:" -ForegroundColor Yellow
Write-Host "-----------------------------------------------------------------------------------------------" -ForegroundColor Yellow
Write-Host "`$GitHub.Repo: " -ForegroundColor Green -NoNewline; Write-Host "$($GitHub.Repo)" -ForegroundColor White
Write-Host "`$GitHub.Owner: " -ForegroundColor Green -NoNewline; Write-Host "$($GitHub.Owner)" -ForegroundColor Cyan


#-----------------------------------------------------------------------------------------------------------------------
# Check .NET versions
#-----------------------------------------------------------------------------------------------------------------------
function Test-Path {
    param (
        [string]$VariableName,
        [string]$Path
    )

    
    if ([System.IO.Directory]::Exists($Path) -or [System.IO.File]::Exists($Path)) {
        Write-Host "✔️  $($VariableName): " -ForegroundColor Green -NoNewline
    } 
    else {
        Write-Host "❌  $($VariableName): " -ForegroundColor Red -NoNewline
    }
    Write-Host "$Path" -ForegroundColor White
}

Write-Host "-----------------------------------------------------------------------------------------------" -ForegroundColor Yellow
Write-Host "Checking Configuration Paths:" -ForegroundColor Yellow
Write-Host "-----------------------------------------------------------------------------------------------" -ForegroundColor Yellow
Test-Path -VariableName "SafetyCulture.RootPath" -Path $SafetyCulture.RootPath
Test-Path -VariableName "SafetyCulture.SolutionPath" -Path $SafetyCulture.SolutionPath
Test-Path -VariableName "SafetyCulture.ProjectDirectory" -Path $SafetyCulture.ProjectDirectory
Test-Path -VariableName "SafetyCulture.ProjectPath" -Path $SafetyCulture.ProjectPath
Test-Path -VariableName "SafetyCulture.TestProjectDirectory" -Path $SafetyCulture.TestProjectDirectory
Test-Path -VariableName "SafetyCulture.TestProjectPath" -Path $SafetyCulture.TestProjectPath
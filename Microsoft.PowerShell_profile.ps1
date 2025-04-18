oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/agnoster.omp.json" | Invoke-Expression

# ---------------------------------------
# Cmdlets
# ---------------------------------------

function Edit-File {
    try {
        $target = $(fd -tf . C:\ | fzf)
        $workDirectory = Split-Path -Path $($target)
        hx -w $($workDirectory) $($target)
    }
    catch {}
}
function Set-Location2 {
    try {
        fd -td . C:\ | fzf | Set-Location
    }
    catch {}
}

# ---------------------------------------
# Aliases
# ---------------------------------------

Set-Alias -Name e -Value Edit-File
Set-Alias -Name g -Value Set-Location2

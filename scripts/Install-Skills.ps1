[CmdletBinding(SupportsShouldProcess)]
param(
    [Parameter(Mandatory = $true)]
    [string]$Destination,

    [ValidateSet('baoyu-xhs-images', 'guizang-social-card-skill', 'xiaohongshu-ops')]
    [string[]]$Skills = @('baoyu-xhs-images', 'guizang-social-card-skill')
)

$ErrorActionPreference = 'Stop'
$toolkitRoot = Split-Path -Parent $PSScriptRoot
$sources = @{
    'baoyu-xhs-images' = 'vendor/baoyu-xhs-images'
    'guizang-social-card-skill' = 'vendor/guizang-social-card-skill'
    'xiaohongshu-ops' = 'vendor/xiaohongshu-ops-skill'
}
$destinationRoot = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($Destination)
$plans = @()

foreach ($skill in ($Skills | Select-Object -Unique)) {
    $source = [IO.Path]::GetFullPath((Join-Path $toolkitRoot $sources[$skill]))
    $target = [IO.Path]::GetFullPath((Join-Path $destinationRoot $skill))
    $sourcePrefix = $source.TrimEnd([IO.Path]::DirectorySeparatorChar) + [IO.Path]::DirectorySeparatorChar
    if ($target.Equals($source, [StringComparison]::OrdinalIgnoreCase) -or
        $target.StartsWith($sourcePrefix, [StringComparison]::OrdinalIgnoreCase)) {
        throw "Destination must be outside the source directory: $target"
    }
    if (-not (Test-Path -LiteralPath (Join-Path $source 'SKILL.md') -PathType Leaf)) {
        throw "Skill source is incomplete: $source"
    }
    if (Test-Path -LiteralPath $target) {
        throw "Destination already exists; compare or back it up before updating: $target"
    }
    $plans += [PSCustomObject]@{ Skill = $skill; Source = $source; Target = $target }
}

foreach ($plan in $plans) {
    if ($PSCmdlet.ShouldProcess($plan.Target, 'Copy skill files (no dependency installation)')) {
        New-Item -ItemType Directory -Path $destinationRoot -Force | Out-Null
        Copy-Item -LiteralPath $plan.Source -Destination $plan.Target -Recurse -Force
        Write-Output "Copied $($plan.Skill) to $($plan.Target)"
    }
}

[CmdletBinding()]
param (
	[Parameter()]
	[String]
	$d = "2Git"
)

$gitDir = ".\src\"
$ideaDir = ".\IDEA\src\main\"

$trivial = @(
	'java\com\group\jsp', 'classes',
	'webapp\css', 'css',
	'webapp\js', 'js',
	'sql', 'sql',
	'demo_page', 'demo_page'
)

if ($d -eq "2IDEA") {
	for ($i = 0; $i -lt 8; $i = $i + 2) {
		$a = $gitDir + ($trivial[$i + 1]) + '\*'
		$b = $ideaDir + ($trivial[$i])
		Copy-Item $a $b	
	}
	Copy-Item $gitDir'html\*' $ideaDir'webapp\'
	Copy-Item $gitDir'jsp\*' $ideaDir'webapp\'
}

if ($d -eq "2Git") {
	for ($i = 0; $i -lt 8; $i = $i + 2) {
		$a = $gitDir + ($trivial[$i + 1])
		$b = $ideaDir + ($trivial[$i]) + "\*"
		Copy-Item $b $a
	}
	Copy-Item $ideaDir'webapp\*.jsp' $gitDir'\jsp\'
	Copy-Item $ideaDir'webapp\*.html' $gitDir'\html\'
}

<!-- This is the project specific website template -->
<!-- It can be changed as liked or replaced by other content -->

<?php

$domain=ereg_replace('[^\.]*\.(.*)$','\1',$_SERVER['HTTP_HOST']);
$group_name=ereg_replace('([^\.]*)\..*$','\1',$_SERVER['HTTP_HOST']);
$themeroot='http://r-forge.r-project.org/themes/rforge/';

echo '<?xml version="1.0" encoding="UTF-8"?>';
?>
<!DOCTYPE html
	PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en   ">

  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title><?php echo $group_name; ?></title>
	<link href="<?php echo $themeroot; ?>styles/estilo1.css" rel="stylesheet" type="text/css" />
  </head>

<body>

<!-- R-Forge Logo -->
<table border="0" width="100%" cellspacing="0" cellpadding="0">
<tr><td>
<a href="/"><img src="<?php echo $themeroot; ?>/images/logo.png" border="0" alt="R-Forge Logo" /> </a> </td> </tr>
</table>


<!-- get project title  -->
<!-- own website starts here, the following may be changed as you like -->

<?php if ($handle=fopen('http://'.$domain.'/export/projtitl.php?group_name='.$group_name,'r')){
$contents = '';
while (!feof($handle)) {
	$contents .= fread($handle, 8192);
}
fclose($handle);
echo $contents; } ?>

<!-- end of project description -->
<p>
The Animal package is a collection of functions for analyzing animal (including humans) behavior data originating from a variety of sources. The package has functions to analyze time coded behaviors from CowLog (open source software for coding behaviors from digital video) data files and observation files with similar format. Other features include hourly, daily, weekly and monthly summaries of time coded data, analysis of RIC (roughage intake system, Insentec automation) data files and labeling measurement data according to behavioral observations for e.g model building purposes.  
</p>

</p>The project was created and is admistered by <strong><a href="http://www.mm.helsinki.fi/~mpastell/">Matti Pastell</a></strong> and the latest stable version of the package can be downloaded from CRAN.</p>

<p>Use the <a href="http://<?php echo $domain; ?>/projects/<?php echo $group_name; ?>/"><strong>project summary page</strong></a> to get the development version, report bugs, ask for features or sign up as a developer.

<p><strong>Links:</strong><p>
<strong><a href="http://www.mm.helsinki.fi/~mpastell/CowLog/">CowLog</a></strong> - Open source software for coding behaviors from digital video



</body>
</html>

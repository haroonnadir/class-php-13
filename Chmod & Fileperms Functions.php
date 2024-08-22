<?php
$file = 'example_file.txt';
// Set permissions to 0755 (rwxr-xr-x)
if (chmod($file, 0755)) {
    echo "Permissions changed successfully.\n";
} else {
    echo "Failed to change permissions.\n";
}
?>

<?php
$file = 'example_file.txt';
$perms = fileperms($file);
if ($perms === false) {
    echo "Failed to get file permissions.\n";
} else {
    // Convert permissions to octal format
    echo "File permissions: " . decoct($perms & 0777) . "\n";
}




$data = "Hello, World!";
file_put_contents('example.txt', $data); // Overwrites or creates 'example.txt' with the content "Hello, World!"


$content = file_get_contents('example.txt'); // Reads the content of 'example.txt' into $content
echo $content; // Outputs the content of 'example.txt'

$files = glob('images/*', GLOB_MARK);
// Output might be: ['image1.jpg', 'image2.jpg', 'directory/']


$files = glob('images/*', GLOB_NOSORT);
// The order of files in the array will be the same as they are found in the directory


$files = glob('nonexistent/*', GLOB_NOCHECK);
// If no files are found, $files will be ['nonexistent/*']


$files = glob('images/*.{jpg,png}', GLOB_BRACE);
// Matches files with .jpg or .png extensions in the 'images' directory


$dirs = glob('images/*', GLOB_ONLYDIR);
// Only directories in 'images' will be returned



$pattern = 'images/*.{jpg,png}';
$files = glob($pattern, GLOB_BRACE | GLOB_MARK | GLOB_NOSORT);
foreach ($files as $file) {
    echo $file . "\n";
}

// Assume the script is located in /var/www/html
echo getcwd(); // Outputs: /var/www/html



// Change to /var/www
if (chdir('/var/www')) {
    echo 'Directory changed to /var/www';
} else {
    echo 'Failed to change directory';
}


// List files in the current directory
$files = scandir(getcwd());
print_r($files);



$dirHandle = opendir('/path/to/directory');
if ($dirHandle) {
    echo 'Directory opened successfully';
} else {
    echo 'Failed to open directory';
}


$dirHandle = opendir('/path/to/directory');
if ($dirHandle) {
    // Directory opened successfully
} else {
    echo 'Failed to open directory';
}

while (($entry = readdir($dirHandle)) !== false) {
    echo $entry . "<br>";
}


closedir($dirHandle);


$dirPath = '/path/to/directory';
// Open the directory
if ($dirHandle = opendir($dirPath)) {
    // Read entries from the directory
    while (($entry = readdir($dirHandle)) !== false) {
        echo $entry . "<br>";
    }
    // Close the directory handle
    closedir($dirHandle);
} else {
    echo 'Failed to open directory';
}



$pattern = '/\d+/'; // Pattern to find one or more digits
$string = 'There are 123 apples';
if (preg_match($pattern, $string, $matches)) {
    echo 'Found digits: ' . $matches[0]; // Outputs: Found digits: 123
}

$pattern = '/\d+/';
$string = 'There are 123 apples and 456 oranges';
preg_match_all($pattern, $string, $matches);
print_r($matches[0]); // Outputs: Array ( [0] => 123 [1] => 456 )



$pattern = '/(\d+)/';
$replacement = '<number>';
$string = 'There are 123 apples and 456 oranges';
$result = preg_replace($pattern, $replacement, $string);
echo $result; // Outputs: There are <number> apples and <number> oranges


$pattern = '/\s+/'; // Split by one or more spaces
$string = 'Split this string by spaces';
$result = preg_split($pattern, $string);
print_r($result); // Outputs: Array ( [0] => Split [1] => this [2] => string [3] => by [4] => spaces )

?>




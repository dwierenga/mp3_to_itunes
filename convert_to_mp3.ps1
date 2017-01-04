Set-Alias ffmpeg C:\bin\ffmpeg.exe
pushd C:\Users\dwierenga\Music\incoming
ls  | %{ 
    $artist, $title = $_.basename.split("@"); 
    $artist=$artist.replace("_"," "); 
    $title=$title.replace("_"," ");  
    $name = $_.basename +".mp3"; 
    ffmpeg -i $_ -vn -metadata title="$title" -metadata artist="$artist" $name 
}
mv *.mp3 "C:\Users\dwierenga\Music\iTunes\iTunes Media\Automatically Add to iTunes\"
popd

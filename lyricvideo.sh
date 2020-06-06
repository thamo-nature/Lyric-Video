#!/bin/bash

#kindly remove ','', and special characters from lyric txt file for best output

#requires imagemagick and ffmpeg tools

input="/root/1.txt" #lyrics .txt file

# "/root/images/black.jpg"  #background image

# "/root/asm"   #output directory

# "/root/img/sad.mp3" #input song/music

#frame rate 0.2 and lesser makes long video from images,increse for short videos

# "/root/asm/video.mp4" is the video from images

# "/root/asm/output.mp4" is the final video

# adjust (-to 00.02.00) value according to the length of the video from image i,e video.mp4 (hour:minute:second)


i=0 
while IFS= read -r line
do
  echo "$line" 

    convert -font helvetica -fill blue -pointsize 80 -draw "text 150,500 '$line'"  /root/images/black.jpg  /root/asm/$i.jpg
      ((i=i+1))    

done < "$input"

ffmpeg -framerate 0.2 -i /root/asm/%0d.jpg /root/asm/video.mp4
ffmpeg -i /root/img/sad.mp3 -ss 00:00:00 -i  /root/asm/video.mp4 -to 00:02:00 -c copy /root/asm/output.mp4

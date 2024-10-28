#!/usr/bin/env zsh

yt-dlp_std(){
    yt-dlp $1
}

yt-dlp_mp4(){
   yt-dlp --merge-output-format mp4 $1
}

yt-dlp_mp3(){
    yt-dlp --extract-audio --audio-format mp3 $1
}

yt-dlp_info(){
	yt-dlp -F --list-subs $1
    echo ""
    echo "to download video with subs and multiple audio streams:"
	echo "yt-dlp --write-sub --sub-langs \"de,en\" -f \"audioID1+audioID2+videoID\" --audio-multistreams --embed-chapters"
}

yt-dlp_bestaudiovideo(){
	yt-dlp --write-sub --sub-langs "de,en.*" -f bestaudio+bestvideo --audio-multistreams --embed-chapters $1
}


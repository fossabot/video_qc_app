require 'rubygems'
require 'streamio-ffmpeg'


movie = FFMPEG::Movie.new(ARGV[0])
filename = File.basename(ARGV[0])

puts "____________________________________"

puts "Filename : #{filename}"
puts "Movie Valid? : #{movie.valid?}" # true (would be false if ffmpeg fails to read the movie)

puts "--"
  
  puts "Duration : #{movie.duration} seconds"
  puts "Bitrate : #{movie.bitrate} kb/s"

    #Movie Size Check

    puts "--"

    size = movie.size                       # makes size the movie.size         
    size = size / 1000000                   # makes size into MB
    puts "File Size : #{size} MB"           # prints filesize
    if size < 100000 then puts "WARNING : Video size less than 1 GB. 
          Standard size is between 2-7 GB." end

puts "--"
                                   
# Codec Check

    codec = String.new                      # defines blank "codec" string
    codec = movie.video_codec               # makes codec the movie.video_codec
    a=0                                     # initialize interstitial variable
    puts "Codec : #{codec}"                 # prints codec
    if (codec=~/(prores|dnxhd)/) then a=1 end
        if a!=1 then puts "Codec : FAIL! - please check specs and re-export. 
        Supported codecs are ProRes 422(HQ) and Avid DNxHD"
        else puts "Codec : PASS!"
        end

puts "--"

# Resolution Check

    resolution = movie.resolution
    b=0
    puts "Resolution : #{resolution}"
    if (resolution=~/(1280x720|1920x1080)/) then b=1 end
        if b!=1 then puts "Dimensions : FAIL! - please check specs and re-export. 
             Standard dimensions are 1920x1080 and 1280x720"
        else puts "Dimensions : PASS!"
        end

puts "--"

# FPS Check
  
  fps = movie.frame_rate.to_s
  c=0
  puts "FPS : #{fps}"
  if (fps=~/(29.97|25.0|24.0|23.98)/) then c=1 end
    if c!=1 then puts "FPS : FAIL! - please check specs and re-export. 
         Standard frame rates are 29.97, 25, 24, 23.98"
    else puts "FPS : PASS!"
    end
  
  
puts "--" 

puts "Audio Codec : #{movie.audio_codec}"
puts "Sample Rate : #{movie.audio_sample_rate}"
puts "Audio Channels : #{movie.audio_channels}"

puts "____________________________________"



# puts movie.audio_stream # "aac, 44100 Hz, stereo, s16, 75 kb/s" (raw audio stream info)
# puts movie.video_stream # "h264, yuv420p, 640x480 [PAR 1:1 DAR 4:3], 371 kb/s, 16.75 fps, 15 tbr, 600 tbn, 1200 tbc" (raw video stream info)
# puts movie.width # 640 (width of the movie in pixels)
# puts movie.height # 480 (height of the movie in pixels)
# puts movie.colorspace # "yuv420p"
#puts "File Size : #{movie.size}" # 455546 (filesize in bytes)

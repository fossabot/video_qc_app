require 'rubygems'
require 'streamio-ffmpeg'


movie = FFMPEG::Movie.new(ARGV[0])

puts "DUR : #{movie.duration}" # 7.5 (duration of the movie in seconds)
puts "BIT : #{movie.bitrate}" # 481 (bitrate in kb/s)
puts "SZE : #{movie.size}" # 455546 (filesize in bytes)

puts "STM : #{movie.video_stream}" # "h264, yuv420p, 640x480 [PAR 1:1 DAR 4:3], 371 kb/s, 16.75 fps, 15 tbr, 600 tbn, 1200 tbc" (raw video stream info)
puts "CDC : #{movie.video_codec}" # "h264"
puts "CLR : #{movie.colorspace}" # "yuv420p"
puts "RES : #{movie.resolution}" # "640x480"
puts "W : #{movie.width}" # 640 (width of the movie in pixels)
puts "H : #{movie.height}" # 480 (height of the movie in pixels)
puts "FPS : #{movie.frame_rate}" # 16.72 (frames per second)

puts "AUD : #{movie.audio_stream}" # "aac, 44100 Hz, stereo, s16, 75 kb/s" (raw audio stream info)
puts "AC : #{movie.audio_codec}" # "aac"
puts "RAT : #{movie.audio_sample_rate}" # 44100
puts "CHN : #{movie.audio_channels}" # 2

movie.valid? # true (would be false if ffmpeg fails to read the movie)
# Start MJPG-streamer
sudo ~/Documents/mjpg_streamer/mjpg_streamer -i "~/Documents/mjpg_streamer/input_uvc.so -f 24 -r 320x240 -d /dev/video0 -y" -o "~/Documents/mjpg_streamer/output_http.so -w ~/Documents/mjpg_streamer/www -p 8080"

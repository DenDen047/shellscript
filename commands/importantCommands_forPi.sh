# Start MJPG-streamer
sudo ~/Documents/mjpg_streamer/mjpg_streamer -i "./input_uvc.so -f 24 -r 320x240 -d /dev/video0 -y" -o "./output_http.so -w ./www -p 8080"

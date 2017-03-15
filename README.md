# Radar-31060540

AVPlayerViewController, weird progress behaviour when zapping among live streams

· Open radar: https://openradar.appspot.com/31060540

# Description
When changing among different live stream assets the progress bar and the indicator presented by AVPlayerViewController jump and flash from the beginning to the end of the event window.

# Steps

This project zaps among 2 different live streams when pressing left or right.

![](preview.gif)


# Expected
The progress indicator points directly to the live position without any jump or flash on the view

# Version:
tvOS 10.2

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class video extends StatefulWidget {
  @override
  const video({super.key});
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<video> {
  final List<String> videoPaths = [
    'assets/videos/12.mp4',
    'assets/videos/11.mp4',
    'assets/videos/10.mp4',
    'assets/videos/9.mp4',
    'assets/videos/8.mp4',
    'assets/videos/5.mp4',
    'assets/videos/6.mp4',
    'assets/videos/7.mp4',
  ];

  late PageController _pageController;
  //int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      controller: _pageController,
      itemCount: videoPaths.length,
      onPageChanged: (index) {
        setState(() {});
      },
      itemBuilder: (context, index) {
        return VideoPlayerItem(
          videoUrl: videoPaths[index],
        );
      },
    );
  }
}

class VideoPlayerItem extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerItem({Key? key, required this.videoUrl}) : super(key: key);

  @override
  _VideoPlayerItemState createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
        _videoPlayerController.play();
        _videoPlayerController.setLooping(true);
        _chewieController = ChewieController(
          videoPlayerController: _videoPlayerController,
          aspectRatio: _videoPlayerController.value.aspectRatio,
          autoPlay: true,
          looping: true,
        );
        setState(() {});
      });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _videoPlayerController.value.isInitialized
        ? Chewie(
            controller: _chewieController!,
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }
}

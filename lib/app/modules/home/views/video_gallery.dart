import 'package:flutter/material.dart';
import 'package:mobile/app/core/theme/decorations.dart';
import 'package:mobile/app/core/values/durations.dart';
import 'package:mobile/app/core/values/values.dart';
import 'package:mobile/app/modules/home/widgets/video_category_picker.dart';

class VideoGallery extends StatefulWidget {
  const VideoGallery({Key? key}) : super(key: key);

  @override
  State<VideoGallery> createState() => _VideoGalleryState();
}

class _VideoGalleryState extends State<VideoGallery> {
  late PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.white.withAlpha(100),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            VideosContainer(size: size, controller: controller),
            const Padding(
              padding: kPaddingDefault,
              child: Text('Caption'),
            ),
            VideoCategoryPicker(
              onCategoryChanged: onCategoryChanged,
            )
          ],
        ),
      ),
    );
  }

  void onCategoryChanged(VideoCategory category) {}
}

class VideosContainer extends StatelessWidget {
  const VideosContainer({
    Key? key,
    required this.size,
    required this.controller,
  }) : super(key: key);

  final Size size;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 4 / 5,
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          PageView(controller: controller, children: [
            Container(
              width: size.width,
              color: Colors.red,
              child: Icon(
                Icons.video_camera_back_outlined,
                size: size.width * 3 / 4,
              ),
            ),
            Container(
              color: Colors.grey,
              child: Icon(
                Icons.video_camera_back_outlined,
                size: size.width * 3 / 4,
              ),
            )
          ]),
          Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: OutlinedButtonTheme(
                data: OutlinedButtonThemeData(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(kPaddingDefault),
                      backgroundColor: MaterialStateProperty.all(
                          Colors.white.withAlpha(100)),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all(const CircleBorder())),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    OutlinedButton(
                        onPressed: () {
                          controller.previousPage(
                              duration: kDurationPageTransition,
                              curve: kCurvePageTransition);
                        },
                        child: const Icon(Icons.skip_previous)),
                    const Spacer(),
                    OutlinedButton(
                        onPressed: () {},
                        child: const Icon(
                          Icons.play_arrow,
                          size: 35,
                        )),
                    OutlinedButton(
                        onPressed: () {},
                        child: const Icon(
                          Icons.pause,
                          size: 35,
                        )),
                    const Spacer(),
                    OutlinedButton(
                        onPressed: () {
                          controller.nextPage(
                              duration: kDurationPageTransition,
                              curve: kCurvePageTransition);
                        },
                        child: const Icon(Icons.skip_next)),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:city_eye/generated/l10n.dart';
import 'package:city_eye/src/config/routes/routes_manager.dart';
import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:city_eye/src/core/resources/image_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:video_player/video_player.dart';

class SupportVideoWidget extends StatefulWidget {
  final VideoPlayerController? videoController;
  final String url;

  const SupportVideoWidget({
    Key? key,
     required this.videoController,
    required this.url,
  }) : super(key: key);

  @override
  State<SupportVideoWidget> createState() => _SupportVideoWidgetState();
}

class _SupportVideoWidgetState extends State<SupportVideoWidget> {
  VideoPlayerController? videoPlayerController;

  @override
  void initState() {
    super.initState();
    videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.url))
          ..initialize().then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'video-player',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).video,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: ColorSchemes.black,
                  letterSpacing: -0.24,
                  fontSize: 16,
                ),
          ),
          const SizedBox(
            height: 16,
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: double.infinity,
                height: 200,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16), color: Colors.red),
                child: AspectRatio(
                  aspectRatio: videoPlayerController!.value.aspectRatio,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      VideoPlayer(
                        widget.videoController!,
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            Routes.fullVideoScreen,
                            arguments: {
                              "videoUrl": widget.url,
                              "isFromUrl": true,
                            }
                          );
                        },
                        child: _buildPlay(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }

  Widget _buildPlay() => Container(
        color: Colors.black26,
        child: Center(
          child: SvgPicture.asset(
            ImagePaths.play,
            fit: BoxFit.scaleDown,
            width: 45,
            height: 45,
          ),
        ),
      );
}

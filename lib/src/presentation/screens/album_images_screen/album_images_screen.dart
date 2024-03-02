import 'dart:io';

import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:city_eye/src/core/base/widget/base_stateful_widget.dart';
import 'package:city_eye/src/core/resources/image_paths.dart';
import 'package:city_eye/src/core/utils/image_type_enum.dart';
import 'package:city_eye/src/domain/entities/album_images/images_album.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:photo_view/photo_view.dart';

class AlbumImageScreen extends BaseStatefulWidget {
  final ImagesAlbum imagesAlbum;
  final ImageType imageType;

  const AlbumImageScreen({
    Key? key,
    required this.imagesAlbum,
    required this.imageType,
  }) : super(key: key);

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _AlbumImageScreenState();
}

class _AlbumImageScreenState extends BaseState<AlbumImageScreen> {
  late PageController _pageController;
  late int _currentIndex;

  @override
  void initState() {
    _currentIndex = widget.imagesAlbum.initialIndex;
    _pageController = PageController(
      initialPage: _currentIndex,
    );
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: widget.imagesAlbum.images.length + 1,
            onPageChanged: (index) {
              setState(() {
                if (index == widget.imagesAlbum.images.length) {
                  _currentIndex = 0;
                  _pageController.jumpToPage(
                    0,
                  );
                } else {
                  _currentIndex = index;
                  _pageController.jumpToPage(
                    index,
                  );
                }
              });
            },
            itemBuilder: (BuildContext context, int index) {
              if (index == widget.imagesAlbum.images.length) {
                index = 0;
              }
              return PhotoView(
                imageProvider: _imageWidget(index),
                initialScale: PhotoViewComputedScale.contained,
                minScale: PhotoViewComputedScale.contained * 0.8,
                maxScale: PhotoViewComputedScale.covered * 1.8,
              );
            },
          ),
          Positioned(
            top: 50,
            left: 20,
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                height: 30,
                width: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.withOpacity(0.5),
                ),
                child: SvgPicture.asset(
                  height: 20,
                  width: 20,
                  ImagePaths.close,
                  color: ColorSchemes.white,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 25,
                    width: 45,
                    color: ColorSchemes.primary,
                    child: Center(
                      child: Text(
                        "${_currentIndex + 1}/${widget.imagesAlbum.images.length}",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: ColorSchemes.white,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 1,
            right: 1,
            bottom: 50,
            child: widget.imagesAlbum.images.length != 1
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: widget.imagesAlbum.images.asMap().entries.map((
                      entry,
                    ) {
                      int index = entry.key;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _currentIndex = index;
                            _pageController.jumpToPage(
                              index,
                            );
                          });
                        },
                        child: Container(
                          width: 10.0,
                          height: 10.0,
                          margin: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 2,
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentIndex == index
                                ? ColorSchemes.primary
                                : ColorSchemes.gray,
                          ),
                        ),
                      );
                    }).toList(),
                  )
                : const SizedBox(),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _imageWidget(int index) => widget.imageType == ImageType.network
      ? NetworkImage(widget.imagesAlbum.images[index].pathUrl)
      : widget.imageType == ImageType.asset
          ? Image.asset(widget.imagesAlbum.images[index].pathUrl)
          : FileImage(File(widget.imagesAlbum.images[index].pathUrl));
}

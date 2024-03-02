import 'package:city_eye/generated/l10n.dart';
import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:flutter/material.dart';

class GalleryImageWidget extends StatefulWidget {
  final String image;

  const GalleryImageWidget({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  State<GalleryImageWidget> createState() => _GalleryImageWidgetState();
}

class _GalleryImageWidgetState extends State<GalleryImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Image.network(
      widget.image,
      fit: BoxFit.cover,
      errorBuilder: (
        context,
        error,
        stackTrace,
      ) {
        return Center(
            child: Text(
          S.of(context).errorLoadingImage,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Colors.black,
              ),
        ));
      },
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) return child;

        return const Center(
          child: CircularProgressIndicator(
            color: ColorSchemes.primary,
          ),
        );
      },
    );
  }
}

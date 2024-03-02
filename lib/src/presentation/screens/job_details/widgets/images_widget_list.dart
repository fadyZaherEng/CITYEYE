import 'package:city_eye/generated/l10n.dart';
import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:city_eye/src/core/resources/image_paths.dart';
import 'package:city_eye/src/domain/entities/support/support_attachment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeletons/skeletons.dart';

class ImagesWidgetList extends StatefulWidget {
  final List<SupportAttachment> images;
  final void Function(int index) onImageItemClick;

  const ImagesWidgetList(
      {required this.images, required this.onImageItemClick, super.key});

  @override
  State<ImagesWidgetList> createState() => _ImagesWidgetListState();
}

class _ImagesWidgetListState extends State<ImagesWidgetList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(
          S.of(context).images,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: ColorSchemes.black, fontSize: 16, letterSpacing: -0.24),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: widget.images.length > 3 ? 200 : 100,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 90, // Set the maximum width for each item
              crossAxisSpacing: 10, // Set the spacing between columns
              mainAxisSpacing: 10, // Set the spacing between rows
              crossAxisCount: 3,
            ),
            itemCount: widget.images.length <= 6 ? widget.images.length : 6,
            // Replace with your desired number of items
            itemBuilder: (BuildContext context, int index) {
              // Replace this with your item widget
              return _image(widget.images[index].pathUrl, index);
            },
          ),
        ),
      ],
    );
  }

  Widget _image(String imageUrl, int index) {
    return GestureDetector(
      onTap: () {
        widget.onImageItemClick(index);
      },
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  _buildPlaceHolderImage(),
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return SkeletonAvatar(
                  style: SkeletonAvatarStyle(
                    maxWidth: double.infinity,
                    width: double.infinity,
                    height: 200.0,
                    maxHeight: 200.0,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                );
              },
            ),
            Visibility(
              visible: widget.images.length > 6 && index == 5,
              child: Container(
                color: ColorSchemes.transparentGrey,
                child: Center(
                    child: Text(
                  "+${widget.images.length - 6}",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: ColorSchemes.white,
                      ),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SvgPicture _buildPlaceHolderImage() {
    return SvgPicture.asset(
      ImagePaths.backArrow,
      fit: BoxFit.fill,
    );
  }
}

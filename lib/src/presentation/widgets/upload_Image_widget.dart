import 'dart:io';

import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:city_eye/src/core/resources/image_paths.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UploadImageWidget extends StatefulWidget {
  final GlobalKey globalKey;
  final String filePath;
  final Function() uploadImage;
  final Function(String filePath) deleteFileAction;
  final bool isMandatory;
  final String? fileErrorMassage;
  final String label;

  const UploadImageWidget({
    Key? key,
    required this.deleteFileAction,
    required this.uploadImage,
    required this.globalKey,
    required this.filePath,
    required this.isMandatory,
    this.fileErrorMassage,
    required this.label,
  }) : super(key: key);

  @override
  State<UploadImageWidget> createState() => _UploadImageWidgetState();
}

class _UploadImageWidgetState extends State<UploadImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        key: widget.globalKey,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          widget.filePath.isEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.label,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: ColorSchemes.black,
                          ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    DottedBorder(
                      color: widget.isMandatory
                          ? ColorSchemes.redError
                          : ColorSchemes.primary,
                      borderType: BorderType.RRect,
                      strokeCap: StrokeCap.butt,
                      dashPattern: const [4, 4],
                      strokeWidth: 1.2,
                      radius: const Radius.circular(8),
                      child: InkWell(
                        onTap: widget.uploadImage,
                        child: Container(
                          color: ColorSchemes.white,
                          height: 150,
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                ImagePaths.imagePlaceHolder,
                                fit: BoxFit.cover,
                                height: 40,
                                width: 35,
                                matchTextDirection: true,
                                alignment: Alignment.center,
                                cacheHeight: 30,
                                cacheWidth: 50,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                widget.label,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: ColorSchemes.gray,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.label,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: ColorSchemes.black,
                          ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 150,
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional.bottomCenter,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              clipBehavior: Clip.hardEdge,
                              child: Image.file(
                                File(widget.filePath),
                                height: 140,
                                fit: BoxFit.fill,
                                width: double.infinity,
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional.topEnd,
                            child: InkWell(
                              onTap: () =>
                                  widget.deleteFileAction(widget.filePath),
                              child: Container(
                                padding: const EdgeInsets.all(2.0),
                                margin:
                                    const EdgeInsetsDirectional.only(end: 10),
                                decoration: BoxDecoration(
                                  color: ColorSchemes.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: ColorSchemes.gray.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 15,
                                      offset: const Offset(0, 0),
                                    )
                                  ],
                                ),
                                child: SvgPicture.asset(
                                  ImagePaths.close,
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
          const SizedBox(height: 8.0),
          Visibility(
            visible: widget.isMandatory,
            child: Text(
              widget.fileErrorMassage ?? "",
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: ColorSchemes.redError,
                    letterSpacing: -.24,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

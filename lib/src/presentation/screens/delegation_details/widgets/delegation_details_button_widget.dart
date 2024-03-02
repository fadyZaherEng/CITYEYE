import 'package:city_eye/generated/l10n.dart';
import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:city_eye/src/core/resources/image_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DelegationDetailsButtonWidget extends StatefulWidget {
  final String delegationName;
  final void Function() onPressed;
  const DelegationDetailsButtonWidget({
    super.key,
    required this.onPressed,
    required this.delegationName,
  });

  @override
  State<DelegationDetailsButtonWidget> createState() =>
      _DelegationDetailsButtonWidgetState();
}

class _DelegationDetailsButtonWidgetState
    extends State<DelegationDetailsButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Center(
        child: Container(
          width: 311,
          height: 44,
          padding: const EdgeInsetsDirectional.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: ColorSchemes.delegationButtonColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                ImagePaths.filePdf,
              ),
              const SizedBox(width: 5),
              Text(
                "${S.current.delegationTo} ${widget.delegationName}",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ColorSchemes.white,
                      fontSize: 14.0,
                    ),
              ),
              const SizedBox(width: 5),
              SvgPicture.asset(
                ImagePaths.icDownload,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

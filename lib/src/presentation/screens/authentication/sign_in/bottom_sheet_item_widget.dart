import 'package:city_eye/generated/l10n.dart';
import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:city_eye/src/core/resources/image_paths.dart';
import 'package:city_eye/src/core/utils/convert_timestamp_to_date_format.dart';
import 'package:city_eye/src/di/injector.dart';
import 'package:city_eye/src/domain/entities/sign_in/unit_list.dart';
import 'package:city_eye/src/domain/entities/sign_in/user_info.dart';
import 'package:city_eye/src/domain/usecase/set_user_unit_list_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeletons/skeletons.dart';

class BottomSheetItemWidget extends StatefulWidget {
  final UnitLists unitLists;
  final UserInfo userInfo;
  final Function() onTap;

  const BottomSheetItemWidget({
    super.key,
    required this.unitLists,
    required this.userInfo,
    required this.onTap,
  });

  @override
  State<BottomSheetItemWidget> createState() => _BottomSheetItemWidgetState();
}

class _BottomSheetItemWidgetState extends State<BottomSheetItemWidget> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        injector<SaveUnitListUseCase>().call(widget.unitLists);
        setState(() {
          _isSelected = !_isSelected;
        });
        Future.delayed(const Duration(milliseconds: 50), widget.onTap);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: SizedBox(
              height: 40,
              width: 72,
              child: Image.network(
                widget.unitLists.compoundLogo,
                errorBuilder: (context, error, stackTrace) {
                  return SvgPicture.asset(
                    ImagePaths.logo,
                  );
                },
                matchTextDirection: true,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) {
                    return const SkeletonLine(
                      style: SkeletonLineStyle(
                        height: 40,
                        width: 72,
                      ),
                    );
                  }
                  return child;
                },
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                widget.unitLists.compoundName,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: ColorSchemes.black,
                    ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    "${widget.unitLists.userTypeName} - ${S.of(context).unit} ${widget.unitLists.unitNo} ",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: const Color(0xFF989898),
                          fontSize: 11,
                        ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Text(
                    " ${widget.unitLists.isActive ? "- ${S.of(context).active}" : "- ${S.of(context).inactive}"} - "
                    "${widget.unitLists.isCompoundVerified ? S.of(context).verified : S.of(context).unverified}",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: const Color(0xFF989898),
                        ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    S.of(context).End,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: const Color(0xFF989898),
                          fontSize: 11,
                        ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    "${convertTimestampToDateDMYFormat(widget.unitLists.userUnitContractEndDate)} ",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: const Color(0xFF989898),
                          fontSize: 11,
                        ),
                  ),
                ],
              ),
            ],
          ),
          const Expanded(child: SizedBox()),
          Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: ColorSchemes.white,
                borderRadius: BorderRadius.circular(40),
                border: Border.all(
                  color: ColorSchemes.border,
                ),
              ),
              child: _isSelected
                  ? const Icon(
                      Icons.check,
                      color: ColorSchemes.primary,
                      size: 16,
                    )
                  : null)
        ],
      ),
    );
  }
}

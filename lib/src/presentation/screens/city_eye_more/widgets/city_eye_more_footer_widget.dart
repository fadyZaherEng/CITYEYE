import 'package:city_eye/generated/l10n.dart';
import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:flutter/material.dart';

class CityEyeMoreFooterWidget extends StatelessWidget {
  final void Function() onLogoutTapped;

  const CityEyeMoreFooterWidget({
    super.key,
    required this.onLogoutTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          SizedBox(
            height: 50,
            child: Stack(
              children: [
                Center(
                  child: InkWell(
                    onTap: onLogoutTapped,
                    child: Text(
                      S.of(context).logout,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: const Color(0xFFE73625),
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${S.of(context).poweredBy} ",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ColorSchemes.gray,
                    ),
              ),
              Text(
                S.of(context).cityEye,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ColorSchemes.black,
                    ),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}

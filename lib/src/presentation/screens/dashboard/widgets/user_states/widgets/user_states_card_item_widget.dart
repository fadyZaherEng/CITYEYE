import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserStatesCardItemWidget extends StatefulWidget {
  final String path;
  final int number;
  final String name;
  final Color color;

  const UserStatesCardItemWidget({
    super.key,
    required this.path,
    required this.color,
    required this.number,
    required this.name,
  });

  @override
  State<UserStatesCardItemWidget> createState() =>
      _UserStatesCardItemWidgetState();
}

class _UserStatesCardItemWidgetState extends State<UserStatesCardItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 64,
          height: 64,
          child: CircleAvatar(
            backgroundColor: ColorSchemes.white,
            radius: 56,
            child: CircleAvatar(
              backgroundColor: ColorSchemes.white,
              radius: 40,
              child: SvgPicture.asset(
                widget.path,
                fit: BoxFit.scaleDown,
                width: 32,
                color: widget.color,
                height: 32,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Flexible(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "${widget.number} \n",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: widget.color,
                        fontSize: 24,
                      ),
                ),
                TextSpan(
                  text: " ${widget.name.split(" ")[0]} \n",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: widget.color,
                      ),
                ),
                TextSpan(
                  text: " ${widget.name.split(" ")[1]} \n",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: widget.color,
                      ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

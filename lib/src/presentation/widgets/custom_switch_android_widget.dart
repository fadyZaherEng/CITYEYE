import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:city_eye/src/presentation/blocs/more/more_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSwitchAndroidWidget extends StatefulWidget {
  final bool isSelected;
  final void Function(bool)? onToggleSwitch;

  const CustomSwitchAndroidWidget({
    super.key,
    required this.isSelected,
    this.onToggleSwitch,
  });

  @override
  State<CustomSwitchAndroidWidget> createState() =>
      _CustomSwitchAndroidWidgetState();
}

class _CustomSwitchAndroidWidgetState extends State<CustomSwitchAndroidWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MoreBloc, MoreState>(
      listener: (context, state) {},
      builder: (context, state) {
        return InkWell(
          onTap: () => widget.onToggleSwitch,
          child: Container(
            height: 20,
            margin: const EdgeInsets.all(5),
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional.center,
                  child: Container(
                    width: 38,
                    height: 16,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20),
                      color: !widget.isSelected
                          ? ColorSchemes.primary
                          : ColorSchemes.gray,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: ColorSchemes.gray.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset: const Offset(0, 0),
                        )
                      ],
                      color: ColorSchemes.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

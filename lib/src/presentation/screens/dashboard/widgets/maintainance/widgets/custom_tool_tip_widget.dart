import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:city_eye/src/domain/entities/dashboard/chart.dart';
import 'package:flutter/material.dart';

class CustomToolTipWidget extends StatefulWidget {
  final ChartModel data;

  const CustomToolTipWidget({super.key, required this.data});

  @override
  State<CustomToolTipWidget> createState() => _CustomToolTipWidgetState();
}

class _CustomToolTipWidgetState extends State<CustomToolTipWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 112,
      padding: const EdgeInsets.all(6),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: ColorSchemes.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: ColorSchemes.toolTipBorder,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.data.xAxisValue.toString(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: ColorSchemes.dashboardGray,
                ),
          ),
          const SizedBox(
            width: 5,
          ),
          Container(
            padding: const EdgeInsets.all(4),
            width: 1,
            height: 50,
            color: ColorSchemes.dashboardGray,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            "${widget.data.yAxisValue.toString()}\n EGP",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: ColorSchemes.toolTipBounds,
                ),
          )
        ],
      ),
    );
  }
}

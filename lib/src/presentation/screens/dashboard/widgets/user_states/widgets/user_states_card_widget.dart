import 'package:city_eye/generated/l10n.dart';
import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:city_eye/src/domain/entities/dashboard/get_compound_status.dart';
import 'package:city_eye/src/presentation/screens/dashboard/widgets/user_states/widgets/user_states_card_item_widget.dart';
import 'package:flutter/material.dart';

class UserStatesCardWidget extends StatefulWidget {
  final List<String> userStatesCardItems;
  final List<Color> userStatesCardColors;
  final List<String> names;
  final GetCompoundAllUserStatus getCompoundAllUserStatus;

  const UserStatesCardWidget({
    super.key,
    required this.userStatesCardItems,
    required this.userStatesCardColors,
    required this.getCompoundAllUserStatus,
    required this.names,
  });

  @override
  State<UserStatesCardWidget> createState() => _UserStatesCardWidgetState();
}

class _UserStatesCardWidgetState extends State<UserStatesCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 254,
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 15,
      ),
      decoration: const BoxDecoration(
        color: ColorSchemes.dashboardCardColor,
        borderRadius: BorderRadiusDirectional.all(Radius.circular(8)),
        boxShadow: [
          BoxShadow(
            color: ColorSchemes.white,
            blurRadius: 10,
            spreadRadius: 15,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Text(
              S.current.userStates,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: ColorSchemes.dashBoardTitleColor,
                  ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 168,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: widget.userStatesCardItems.asMap().entries.map((e) {
                int index = e.key;
                return UserStatesCardItemWidget(
                  path: e.value,
                  number: index == 0
                      ? widget.getCompoundAllUserStatus.active
                      : index == 1
                          ? widget.getCompoundAllUserStatus.pending
                          : widget.getCompoundAllUserStatus.notActive,
                  name: widget.names[index],
                  color: widget.userStatesCardColors[index],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

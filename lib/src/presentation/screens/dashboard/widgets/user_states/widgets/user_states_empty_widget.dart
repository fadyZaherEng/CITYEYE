import 'package:city_eye/generated/l10n.dart';
import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:city_eye/src/presentation/screens/dashboard/widgets/user_states/widgets/user_states_card_item_widget.dart';
import 'package:flutter/material.dart';

class UserStatesEmptyWidget extends StatefulWidget {
  final List<String> userStatesCardItems;
  final List<String> names;

  const UserStatesEmptyWidget({
    super.key,
    required this.userStatesCardItems,
    required this.names,
  });

  @override
  State<UserStatesEmptyWidget> createState() => _UserStatesEmptyWidgetState();
}

class _UserStatesEmptyWidgetState extends State<UserStatesEmptyWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 254,
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 15,
      ),
      decoration: const BoxDecoration(
        color: ColorSchemes.dashboardEmptyStates,
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
                    color: const Color(0xFF222222),
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
                  number: 0,
                  name: widget.names[index],
                  color: ColorSchemes.dashboardUserStates,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

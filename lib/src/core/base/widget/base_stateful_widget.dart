// ignore_for_file: no_logic_in_create_state

import 'dart:async';

import 'package:city_eye/src/core/base/manager/loading/loading_manager.dart';
import 'package:city_eye/src/core/utils/show_no_internet_dialog_widget.dart';
import 'package:city_eye/src/di/injector.dart';
import 'package:city_eye/src/domain/usecase/get_no_internet_use_case.dart';
import 'package:city_eye/src/domain/usecase/set_no_internet_use_case.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract class BaseStatefulWidget extends StatefulWidget {
  final Color materialColor;

  const BaseStatefulWidget({
    Key? key,
    this.materialColor = Colors.white,
  }) : super(key: key);

  @override
  BaseState createState() {
    return baseCreateState();
  }

  BaseState baseCreateState();
}

abstract class BaseState<W extends BaseStatefulWidget> extends State<W>
    with LoadingManager {
  @override
  Widget build(BuildContext context) {
    return baseWidget();
  }

  @override
  void initState() {
    super.initState();
  }

  Widget baseWidget() {
    return Material(
      color: widget.materialColor,
      child: Stack(
        fit: StackFit.expand,
        children: [baseBuild(context), loadingManagerWidget()],
      ),
    );
  }

  void changeState() {
    setState(() {});
  }

  @override
  void runChangeState() {
    changeState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget baseBuild(BuildContext context);
}

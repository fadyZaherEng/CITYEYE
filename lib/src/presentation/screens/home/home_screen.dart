// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'dart:async';

import 'package:city_eye/generated/l10n.dart';
import 'package:city_eye/src/config/routes/routes_manager.dart';
import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:city_eye/src/core/base/widget/base_stateful_widget.dart';
import 'package:city_eye/src/core/resources/image_paths.dart';
import 'package:city_eye/src/core/utils/show_bottom_sheet.dart';
import 'package:city_eye/src/core/utils/show_massage_dialog_widget.dart';
import 'package:city_eye/src/data/sources/remote/home/request/validate_visitor_qr_code_request.dart';
import 'package:city_eye/src/domain/entities/home/notification_count.dart';
import 'package:city_eye/src/domain/entities/home/security/validate_visitor_qr_code_in.dart';
import 'package:city_eye/src/domain/entities/home/stuff_attendance_information.dart';
import 'package:city_eye/src/domain/entities/home/visitor.dart';
import 'package:city_eye/src/domain/entities/sign_in/user.dart';
import 'package:city_eye/src/domain/entities/support/support.dart';
import 'package:city_eye/src/presentation/blocs/home/home_bloc.dart';
import 'package:city_eye/src/presentation/screens/dashboard/dashboard_screen.dart';
import 'package:city_eye/src/presentation/screens/home/skeleton/skeleton_home_widget.dart';
import 'package:city_eye/src/presentation/screens/home/utils/home_enum.dart';
import 'package:city_eye/src/presentation/screens/home/utils/home_extension.dart';
import 'package:city_eye/src/presentation/screens/home/widgets/check_in_out_widget.dart';
import 'package:city_eye/src/presentation/screens/home/widgets/content_pin_code_widget.dart';
import 'package:city_eye/src/presentation/screens/home/widgets/home_header_section.dart';
import 'package:city_eye/src/presentation/screens/home/widgets/security_items_widget.dart';
import 'package:city_eye/src/presentation/screens/home/widgets/technical_items_widget.dart';
import 'package:city_eye/src/presentation/widgets/search_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends BaseStatefulWidget {
  const HomeScreen({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _HomeScreenState();
}

class _HomeScreenState extends BaseState<HomeScreen> {
  HomeBloc get _bloc => BlocProvider.of<HomeBloc>(context);

  final TextEditingController _searchTextEditingController =
      TextEditingController();
  String _searchText = '';
  List<TextEditingController> _controllers = [];

  User _user = const User();
  UserAttendanceInformation _userAttendanceInformation =
      const UserAttendanceInformation();
  List<Visitor> _visitors = [];
  List<Support> _jobs = [];

  NotificationCount notificationCount = const NotificationCount(count: 0);

  ValueNotifier<String> pinCodeErrorMessage = ValueNotifier('');

  Support _jobReturnedFromDetails = const Support();
  bool isDebouncing = false;

  bool isFetchVisitorOrJob = false;

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() {
    // _user = GetUserInformationUseCase(injector())();
    _controllers = _user.userType.code == CityEyeUserType.security.toUserType
        ? List.generate(6, (index) => TextEditingController())
        : [];
    _getUserAttendanceInformation();
    _getUserDataBasedOnType(_user);
  }

  @override
  void didUpdateWidget(covariant HomeScreen oldWidget) {
    _getUserDataBasedOnType(_user);
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    _disposePinCodeController();
    super.deactivate();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value:
          const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) async {
          if (state is ShowLoadingState) {
            showLoading();
          } else if (state is HideLoadingState) {
            hideLoading();
          } else if (state is CheckInSuccessState) {
            showMessageDialogWidget(
              context: context,
              text: state.successMessage,
              icon: ImagePaths.icSuccessNew,
              buttonText: S.of(context).ok,
              onTap: () {
                Navigator.of(context).pop();
              },
            );
          } else if (state is CheckOutSuccessState) {
            showMessageDialogWidget(
              context: context,
              text: state.successMessage,
              icon: ImagePaths.icSuccessNew,
              buttonText: S.of(context).ok,
              onTap: () {
                Navigator.of(context).pop();
              },
            );
          } else if (state is CheckInErrorState) {
            showMessageDialogWidget(
              context: context,
              text: state.errorMessage,
              icon: ImagePaths.icCancelNew,
              buttonText: S.of(context).ok,
              onTap: () async {
                Navigator.of(context).pop();
              },
            );
          } else if (state is CheckOutErrorState) {
            showMessageDialogWidget(
              context: context,
              text: state.errorMessage,
              icon: ImagePaths.icCancelNew,
              buttonText: S.of(context).ok,
              onTap: () {
                Navigator.of(context).pop();
              },
            );
          } else if (state is SuccessFetchAllVisitorsState) {
            _visitors = List.from(state.visitors);
            isFetchVisitorOrJob = true;
          } else if (state is FailureFetchAllVisitorsState) {
            showMessageDialogWidget(
              context: context,
              text: state.errorMessage,
              icon: ImagePaths.icCancelNew,
              buttonText: S.of(context).ok,
              onTap: () {
                Navigator.of(context).pop();
              },
            );
          } else if (state is SuccessFetchAllJobsState) {
            _jobs = List.from(state.jobs);
            isFetchVisitorOrJob = true;
          } else if (state is FailureFetchAllJobsState) {
            showMessageDialogWidget(
              context: context,
              text: state.message,
              icon: ImagePaths.icCancelNew,
              buttonText: S.of(context).ok,
              onTap: () {
                Navigator.of(context).pop();
              },
            );
          } else if (state is InvalidPinCodeState) {
            pinCodeErrorMessage.value = S.of(context).invalidPinCode;
          } else if (state is ValidPinCodeState) {
            pinCodeErrorMessage.value = "";
            _onPinCodeSubmit(state.pinCode);
          } else if (state is RemoveValuesFromPinCodeTextFieldState) {
            _clearValuesPinCodeController();
          } else if (state is ShowBottomSheetWidgetForSecurityState) {
            showBottomSheetWidget(
              height: 380.0,
              context: context,
              content: ValueListenableBuilder(
                builder: (context, value, _) => ContentPinCodeWidget(
                  controllers: _controllers.toList(),
                  onOtpChange: (pinCode) {
                    if (pinCode.length == 6) {
                      _bloc.add(ValidationPinCodeEvent(pinCode: pinCode));
                    }
                  },
                  errorMessage: value,
                  onTapSubmit: (pinCode) {
                    _onPinCodeSubmit(pinCode);
                  },
                  error: value.isEmpty ? false : true,
                ),
                valueListenable: pinCodeErrorMessage,
              ),
              titleLabel: '',
            ).then(
              (_) {
                pinCodeErrorMessage.value = "";
                _bloc.add(RemoveValuesFromPinCodeTextFieldEvent());
                _getUserDataBasedOnType(_user);
              },
            );
          } else if (state is ValidVisitorPinCodeState) {
            Navigator.of(context).pop();
            _bloc.add(
              NavigateToQrDetailsScreenEvent(
                isComeFromQrScanner: true,
                validateVisitorQrCodeIn: state.validateVisitorQrCodeIn,
                qrCodeDetailsIdOrPinCode: int.parse(state.qrId),
              ),
            );
          } else if (state is InvalidVisitorPinCodeState) {
            showMessageDialogWidget(
              context: context,
              text: state.errorMessage,
              icon: ImagePaths.icCancelNew,
              buttonText: S.of(context).ok,
              onTap: () {
                Navigator.of(context).pop();
              },
            );
          } else if (state is NavigateToQrDetailsScreenState) {
            Navigator.of(context).pushNamed(Routes.qrDetails, arguments: {
              'qrCodeDetailsIdOrPinCode': state.qrCodeDetailsIdOrPinCode,
              'isComeFromQrScanner': state.isComeFromQrCodeScanner,
              'qrCodeDetailsComeFromQrCode': state.qrCodeDetails
            }).then((value) {
              _getVisitorsEvent();
              _getNotificationsCountEvent();
            });
          } else if (state is NavigateToJobDetailsScreenState) {
            _jobReturnedFromDetails = await Navigator.of(context)
                .pushNamed(Routes.jobDetails, arguments: state.id)
                .then((value) => {
                      _getUserDataBasedOnType(_user),
                      _getNotificationsCountEvent(),
                    }) as Support;
            _bloc.add(ChangeJobItemSupportEvent(
                jobs: _jobs, job: _jobReturnedFromDetails));
          } else if (state is ChangeJobItemSupportState) {
            _jobs = List.from(state.jobs);
          } else if (state is SearchVisitorState) {
            _visitors = List.from(state.visitors);
          } else if (state is ClearSearchVisitorState) {
            _visitors = List.from(state.visitors);
          } else if (state is ClearSearchJobState) {
            _jobs = List.from(state.jobs);
          } else if (state is SearchJobState) {
            _jobs = List.from(state.jobs);
          } else if (state is SuccessGetStuffAttendanceInformationState) {
            _userAttendanceInformation = state.stuffAttendanceInformation;
          } else if (state is FailedGetStuffAttendanceInformationState) {
            showMessageDialogWidget(
                context: context,
                text: state.errorMessage,
                icon: ImagePaths.icCancelNew,
                buttonText: S.of(context).ok,
                onTap: () {
                  Navigator.of(context).pop();
                });
          } else if (state is GetNotificationCountSuccessState) {
            notificationCount = NotificationCount(count: state.count);
          } else if (state is GetNotificationCountFailedState) {}
        },
        buildWhen: (prev, curr) => prev != curr,
        builder: (context, homeState) {
          if (((homeState is ShowSkeletonState || !isFetchVisitorOrJob)) &&
              _user.userType.code != CityEyeUserType.manager.toUserType) {
            return const SafeArea(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  SkeletonHomeWidget(
                    padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 30.0),
                  ),
                ],
              ),
            );
          } else {
            return SafeArea(
              child: RefreshIndicator(
                onRefresh: () async => _getUserDataBasedOnType(_user),
                color: ColorSchemes.primary,
                child: _user.userType.code == CityEyeUserType.manager.toUserType
                    ? DashboardScreen(
                        user: _user,
                        notificationCount: notificationCount,
                      )
                    : SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            HomeHeaderSection(
                              user: _user,
                              notificationCount: notificationCount,
                              onNotificationTapped: () {
                                Navigator.of(context)
                                    .pushNamed(Routes.notifications)
                                    .then((value) {
                                  _getUserDataBasedOnType(_user);
                                  _getNotificationsCountEvent();
                                });
                              },
                            ),
                            const SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  16.0, 0.0, 16.0, 30.0),
                              child: Column(
                                children: [
                                  SearchTextFieldWidget(
                                    controller: _searchTextEditingController,
                                    searchText: S.of(context).search,
                                    onChange: (value) {
                                      _searchText = value.trim();
                                      if (_user.userType.code ==
                                          CityEyeUserType.security.toUserType) {
                                        _bloc.add(
                                            SearchVisitorEvent(value: value));
                                      } else if (_user.userType.code ==
                                          CityEyeUserType
                                              .technical.toUserType) {
                                        _bloc.add(SearchJobEvent(value.trim()));
                                      } else if (_user.userType.code ==
                                          CityEyeUserType.manager.toUserType) {}
                                    },
                                    onClear: () {
                                      _searchText = '';
                                      if (_user.userType.code ==
                                          CityEyeUserType.security.toUserType) {
                                        _bloc.add(ClearSearchVisitorEvent());
                                      } else if (_user.userType.code ==
                                          CityEyeUserType
                                              .technical.toUserType) {
                                        _bloc.add(ClearSearchJobEvent());
                                      } else if (_user.userType.code ==
                                          CityEyeUserType.manager.toUserType) {}
                                    },
                                  ),
                                  const SizedBox(height: 16.0),
                                  CheckInAndOutWidget(
                                    stuffAttendanceInformation:
                                        _userAttendanceInformation,
                                    onCheckIn: () {
                                      _bloc.add(CheckInEvent());
                                    },
                                    onCheckOut: () {
                                      _bloc.add(CheckOutEvent());
                                    },
                                  ),
                                  const SizedBox(height: 22.0),
                                  _user.userType.code ==
                                          CityEyeUserType.security.toUserType
                                      ? SecurityItemsWidget(
                                          visitors: _visitors.toList(),
                                          onTapCardWidget: (visitor) {
                                            _bloc.add(
                                              NavigateToQrDetailsScreenEvent(
                                                isComeFromQrScanner: false,
                                                qrCodeDetailsIdOrPinCode:
                                                    visitor.id,
                                                validateVisitorQrCodeIn:
                                                    const ValidateVisitorQrCodeIn(
                                                  isValid: false,
                                                  sorceKey: 0,
                                                ),
                                              ),
                                            );
                                          },
                                          onTapPinCode:
                                              _openPinCodeBottomSheetForSecurity,
                                          onRefresh: () {
                                            _bloc.add(GetVisitorsEvent(
                                                isShowLoading: true,
                                                searchValue:
                                                    _searchText.trim()));
                                          },
                                        )
                                      : TechnicalItemsWidget(
                                          jobs: _jobs.toList(),
                                          onTapCard: (job) {
                                            _bloc.add(
                                              NavigateToJobDetailsScreenEvent(
                                                  id: job.requestId),
                                            );
                                          },
                                          onRefresh: () {
                                            _bloc.add(GetJobsEvent(
                                                isShowLoading: true,
                                                searchValue:
                                                    _searchText.trim()));
                                          },
                                        )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
              ),
            );
          }
        },
      ),
    );
  }

  void _onPinCodeSubmit(String pinCode) {
    if (!isDebouncing) {
      setState(() {
        isDebouncing = true;
      });
      if (pinCode.length == 6) {
        _bloc.add(
          ValidationVisitorPinCodeEvent(
            validateVisitorQrCodeRequest: ValidateVisitorQrCodeRequest(
              pinCode: int.parse(pinCode),
              encryptedQr: "",
            ),
          ),
        );
      } else {
        _bloc.add(ValidationPinCodeEvent(pinCode: pinCode));
      }

      Timer(const Duration(seconds: 1), () {
        if (mounted) {
          setState(() {
            isDebouncing = false;
          });
        }
      });
    }
  }

  void _clearValuesPinCodeController() {
    _controllers.forEach((element) => element.clear());
  }

  void _disposePinCodeController() {
    _controllers.forEach((element) => element.dispose());
  }

  void _getUserDataBasedOnType(User user) {
    if (_user.userType.code == CityEyeUserType.security.toUserType) {
      _getVisitorsEvent();
    }
    if (_user.userType.code == CityEyeUserType.technical.toUserType) {
      _getJobsEvent();
    }

    _getNotificationsCountEvent();
  }

  Future<void> _getUserAttendanceInformation() async {
    if (_userAttendanceInformation.workingMinutes == -1) {
      _bloc.add(GetUserAttendanceInformationEvent());
    }
  }

  void _getVisitorsEvent() =>
      _bloc.add(GetVisitorsEvent(searchValue: _searchText.trim()));

  void _getJobsEvent() => _bloc.add(GetJobsEvent(
        searchValue: _searchText.trim(),
      ));

  void _openPinCodeBottomSheetForSecurity() =>
      _bloc.add(ShowPinCodeBottomSheetForSecurityEvent());

  void _getNotificationsCountEvent() {
    _bloc.add(GetNotificationCountEvent());
  }
}

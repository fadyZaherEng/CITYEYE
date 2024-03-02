// ignore_for_file: use_build_context_synchronously, avoid_single_cascade_in_expression_statements

import 'package:city_eye/generated/l10n.dart';
import 'package:city_eye/src/config/routes/routes_manager.dart';
import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:city_eye/src/core/base/widget/base_stateful_widget.dart';
import 'package:city_eye/src/core/resources/image_paths.dart';
import 'package:city_eye/src/core/resources/shared_preferences_keys.dart';
import 'package:city_eye/src/core/utils/convert_timestamp_to_date_format.dart';
import 'package:city_eye/src/core/utils/extension/color_extension.dart';
import 'package:city_eye/src/core/utils/image_type_enum.dart';
import 'package:city_eye/src/core/utils/show_action_dialog_widget.dart';
import 'package:city_eye/src/core/utils/show_bottom_sheet.dart';
import 'package:city_eye/src/core/utils/show_message_dialog_widget.dart';
import 'package:city_eye/src/data/sources/remote/support/request/change_support_request.dart';
import 'package:city_eye/src/domain/entities/album_images/images_album.dart';
import 'package:city_eye/src/domain/entities/support/support.dart';
import 'package:city_eye/src/domain/entities/support/support_attachment.dart';
import 'package:city_eye/src/presentation/blocs/job_details/job_details_bloc.dart';
import 'package:city_eye/src/presentation/screens/album_images_screen/album_images_screen.dart';
import 'package:city_eye/src/presentation/screens/job_details/skeleton/job_details_skeleton.dart';
import 'package:city_eye/src/presentation/screens/job_details/utils/support_status.dart';
import 'package:city_eye/src/presentation/screens/job_details/widgets/add_payment_bottom_sheet.dart';
import 'package:city_eye/src/presentation/screens/job_details/widgets/bottom_widget_item.dart';
import 'package:city_eye/src/presentation/screens/job_details/widgets/images_widget_list.dart';
import 'package:city_eye/src/presentation/widgets/build_app_bar_widget.dart';
import 'package:city_eye/src/presentation/widgets/custom_snack_bar_widget.dart';
import 'package:city_eye/src/presentation/widgets/support_audio_widget.dart';
import 'package:city_eye/src/presentation/widgets/support_video_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skeletons/skeletons.dart';
import 'package:video_player/video_player.dart';

class JobDetailsScreen extends BaseStatefulWidget {
  final int requestId;

  const JobDetailsScreen({
    required this.requestId,
    super.key,
  });

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _JobDetailsScreenState();
}

class _JobDetailsScreenState extends BaseState<JobDetailsScreen> {
  JobDetailsBloc get _bloc => BlocProvider.of<JobDetailsBloc>(context);
  VideoPlayerController? _videoPlayerController;

  final int _minLengthOfProblem = 3;
  final int _maxLengthOfProblem = 50;
  final int _maxDurationOfVideo = 10;
  final int _maxDurationOfAudio = 10;
  final int _minLengthOfImages = 1;
  final int _maxLengthOfImages = 5;

  String languageCode = "";
  Support _jobDetails = Support();
  SupportAttachment _audioSupportAttachment = const SupportAttachment();
  SupportAttachment _videoSupportAttachment = const SupportAttachment();
  List<SupportAttachment> _imageSupportAttachment = List.empty();
  List<SupportStatusEnum> _availableStatus = List.empty();

  @override
  void initState() {
    _bloc.add(GetJobsDetailsEvent(requestId: widget.requestId));
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    languageCode = ((await SharedPreferences.getInstance())
            .getString(SharedPreferenceKeys.language) ??
        "");
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<JobDetailsBloc, JobDetailsState>(
      listener: (context, state) {
        if (state is BackState) {
          Navigator.pop(context, _jobDetails);
        } else if (state is ActionWidgetClickedState) {
          _onActionWidgetClicked();
        } else if (state is ShowSkeletonState) {
        } else if (state is ShowLoadingState) {
          showLoading();
        } else if (state is HideLoadingState) {
          hideLoading();
        } else if (state is GetJobDetailsFailedState) {
          CustomSnackBarWidget.show(
            context: context,
            message: state.message,
            path: ImagePaths.icCancelNew,
            backgroundColor: ColorSchemes.snackBarError,
          );
        } else if (state is GetJobDetailsSuccessState) {
          if (state.isStatusChange) {
            CustomSnackBarWidget.show(
              context: context,
              message: state.massage,
              path: ImagePaths.icSuccessNew,
              backgroundColor: ColorSchemes.snackBarSuccess,
            );
            _jobDetails = _jobDetails.copyWith(
              supportTechStatus: _jobDetails.supportTechStatus.copyWith(
                statusId: state.job.supportTechStatus.statusId,
                statusName: state.job.supportTechStatus.statusName,
                code: state.job.supportTechStatus.code,
              ),
            );
          } else {
            _jobDetails = state.job;
          }
          _bloc.add(ExtractSupportAttachmentEvent(support: state.job));
          _bloc.add(GetAvailableSupportStatusEvent(
              statusId: state.job.supportTechStatus.statusId));
        } else if (state is GetAvailableSupportStatusState) {
          _availableStatus = List.from(state.availableStatus);
        } else if (state is ExtractSupportAttachmentState) {
          if (state.video.pathUrl.isNotEmpty) {
            _videoPlayerController ??=
                VideoPlayerController.networkUrl(Uri.parse(state.video.pathUrl))
                  ..initialize().then((value) {
                    setState(() {});
                  });
          }

          _imageSupportAttachment = List.from(state.images);
          _audioSupportAttachment = _audioSupportAttachment.copyWith(
            name: state.audio.name,
            pathUrl: state.audio.pathUrl,
          );
          _videoSupportAttachment = _videoSupportAttachment.copyWith(
            pathUrl: state.video.pathUrl,
            name: state.video.name,
          );
        } else if (state is OnBottomMoreFailedState) {
          _showMessageDialogWidget(
              text: state.message, icon: ImagePaths.icCancelNew);
        } else if (state is OnBottomMoreSuccessState) {
          _showContextMenu(context);
        } else if (state is OnNeedPaymentClickState) {
          _showBottomSheet(context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: buildAppBarWidget(context,
              title: '#${widget.requestId.toString()}',
              isHaveBackButton: true, onBackButtonPressed: () {
            _bloc.add(BackEvent());
          },
              actionWidget: state is ShowSkeletonState
                  ? const SizedBox.shrink()
                  : GestureDetector(
                      onTap: () => _bloc.add(ActionWidgetClickedEvent()),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: SvgPicture.asset(ImagePaths.commentIcon),
                      ))),
          body: state is ShowSkeletonState
              ? const JobDetailsSkeleton()
              : Column(
                  children: [
                    Expanded(
                      child: CustomScrollView(
                        slivers: [
                          SliverFillRemaining(
                            hasScrollBody: false,
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.network(
                                            _jobDetails.supportCategory.logo,
                                            height: 20,
                                            width: 20,
                                            placeholderBuilder: (context) =>
                                                SvgPicture.asset(
                                                    ImagePaths.frame),
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            _jobDetails.supportCategory.name,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(
                                                    color: ColorSchemes.black,
                                                    fontSize: 16),
                                          ),
                                          const Spacer(),
                                          Text(
                                            convertTimestampToDateFormat(
                                                _jobDetails.requestDate),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(
                                                    color: ColorSchemes.gray,
                                                    fontSize: 16),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Expanded(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      ImagePaths.unitIcon,
                                                      height: 20,
                                                      width: 20,
                                                    ),
                                                    const SizedBox(width: 8),
                                                    Text(
                                                      S.of(context).unit,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodySmall!
                                                          .copyWith(
                                                              color:
                                                                  ColorSchemes
                                                                      .gray,
                                                              fontSize: 16),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  width: 100.0,
                                                  constraints:
                                                      const BoxConstraints(
                                                          maxWidth: 200.0),
                                                  child: Text(
                                                    _jobDetails
                                                        .supportUserUnits.name,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall!
                                                        .copyWith(
                                                          color: ColorSchemes
                                                              .black,
                                                          fontSize: 16.0,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Container(
                                                  width: 10,
                                                  height: 10,
                                                  decoration: BoxDecoration(
                                                    color: _jobDetails
                                                        .supportTechStatus
                                                        .code
                                                        .toColor,
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                40)),
                                                  ),
                                                ),
                                                const SizedBox(width: 8),
                                                Flexible(
                                                  child: Text(
                                                    _jobDetails
                                                        .supportTechStatus
                                                        .statusName,
                                                    maxLines: 2,
                                                    softWrap: true,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall!
                                                        .copyWith(
                                                            color: _jobDetails
                                                                .supportTechStatus
                                                                .code
                                                                .toColor,
                                                            fontSize: 16,
                                                            letterSpacing:
                                                                -0.24),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 32),
                                      Text(
                                        _jobDetails.requestDescription,
                                        maxLines: 4,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                              color: ColorSchemes.gray,
                                              fontSize: 16,
                                              letterSpacing: -0.16,
                                            ),
                                      ),
                                      const SizedBox(height: 24),
                                      if (_videoSupportAttachment
                                          .pathUrl.isNotEmpty) ...[
                                        if (_videoPlayerController!
                                            .value.isInitialized) ...[
                                          SupportVideoWidget(
                                            videoController:
                                                _videoPlayerController,
                                            url:
                                                _videoSupportAttachment.pathUrl,
                                          )
                                        ] else ...[
                                          Center(
                                            child: Container(
                                              height: 200,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                color: Colors.grey[200],
                                              ),
                                              child: SkeletonLine(
                                                style: SkeletonLineStyle(
                                                  width: double.infinity,
                                                  height: 200,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                            ),
                                          )
                                        ]
                                      ] else ...[
                                        const SizedBox.shrink(),
                                      ],
                                      _imageSupportAttachment.isNotEmpty
                                          ? ImagesWidgetList(
                                              images: _imageSupportAttachment,
                                              onImageItemClick: (index) {
                                                _onNavigateToAlbumImagesScreenState(
                                                    images:
                                                        _imageSupportAttachment,
                                                    initialIndex: index);
                                              },
                                            )
                                          : const SizedBox.shrink(),
                                      const SizedBox(height: 20),
                                      _audioSupportAttachment.pathUrl.isEmpty
                                          ? const SizedBox.shrink()
                                          : SupportAudioWidget(
                                              audioPath: _audioSupportAttachment
                                                  .pathUrl,
                                            ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 88,
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 0),
                            spreadRadius: 0,
                            blurRadius: 32,
                            color: Color.fromRGBO(0, 0, 0, 0.12),
                          ),
                        ],
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: _availableStatus.any((element) =>
                                        element == SupportStatusEnum.receive)
                                    ? null
                                    : Colors.grey[200],
                              ),
                              child: BottomWidgetItem(
                                imagePath: ImagePaths.receiveIcon,
                                text: S.of(context).receive,
                                onBottomItemTap: () {
                                  if (_availableStatus.any((element) =>
                                      element == SupportStatusEnum.receive)) {
                                    _onBottomReceiveClickEvent(
                                      ChangeSupportRequest(
                                        requestId: widget.requestId,
                                        statusCode: "approved",
                                        description: "",
                                        totalAmount: 0,
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          ),
                          Container(
                            height: 32,
                            width: 1,
                            color: ColorSchemes.black,
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: _availableStatus.any((element) =>
                                        element == SupportStatusEnum.startJob)
                                    ? null
                                    : Colors.grey[200],
                              ),
                              child: BottomWidgetItem(
                                  imagePath: ImagePaths.startJobIcon,
                                  text: S.of(context).startJob,
                                  onBottomItemTap: () {
                                    if (_availableStatus.any((element) =>
                                        element ==
                                        SupportStatusEnum.startJob)) {
                                      _onBottomStartJobClickEvent(
                                        ChangeSupportRequest(
                                          requestId: widget.requestId,
                                          statusCode: 'prograss',
                                          description: "",
                                          totalAmount: 0,
                                        ),
                                      );
                                    }
                                  }),
                            ),
                          ),
                          Container(
                            height: 32,
                            width: 1,
                            color: ColorSchemes.black,
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: _availableStatus.any((element) =>
                                        element == SupportStatusEnum.complete)
                                    ? null
                                    : Colors.grey[200],
                              ),
                              child: BottomWidgetItem(
                                imagePath: ImagePaths.completeIcon,
                                text: S.of(context).complete,
                                onBottomItemTap: () {
                                  if (_availableStatus.any((element) =>
                                      element == SupportStatusEnum.complete)) {
                                    _onBottomCompleteClickEvent(
                                      ChangeSupportRequest(
                                        requestId: widget.requestId,
                                        statusCode: 'completed',
                                        description: "",
                                        totalAmount: 0,
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          ),
                          Container(
                            height: 32,
                            width: 1,
                            color: ColorSchemes.black,
                          ),
                          Expanded(
                            child: BottomWidgetItem(
                              imagePath: ImagePaths.moreIcon,
                              text: S.of(context).more,
                              onBottomItemTap: () {
                                _bloc.add(OnBottomMoreClickEvent());
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
        );
      },
    );
  }

  void _showMessageDialogWidget({
    required String text,
    required String icon,
  }) {
    showMessageDialogWidget(
        context: context,
        text: text,
        icon: icon,
        buttonText: S.of(context).ok,
        onTap: () {
          _bloc.add(BackEvent());
        });
  }

  void _onNavigateToAlbumImagesScreenState({
    required List<SupportAttachment> images,
    required int initialIndex,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AlbumImageScreen(
          imagesAlbum: ImagesAlbum(
            initialIndex: initialIndex,
            images: images,
          ),
          imageType: ImageType.network,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController?.dispose();
  }

  void _onActionWidgetClicked() {
    Navigator.pushNamed(context, Routes.comments, arguments: widget.requestId);
  }

  void _showContextMenu(BuildContext context) async {
    final RenderObject? overlay =
        Overlay.of(context).context.findRenderObject();
    double width = MediaQuery.of(context).size.width;
    if (languageCode.toLowerCase() == "ar") {
      width = -1 * width;
    } else {
      width = width.abs();
    }
    await showMenu(
      context: context,
      position: RelativeRect.fromRect(
        Rect.fromLTWH(
            width, MediaQuery.of(context).size.height - 240, 100, 100),
        Rect.fromLTWH(0, 0, overlay!.paintBounds.size.width,
            overlay.paintBounds.size.height),
      ),
      items: [
        PopupMenuItem(
          padding: EdgeInsets.zero,
          onTap: () {
            if (_availableStatus
                .any((element) => element == SupportStatusEnum.hold)) {
              _onBottomHoldClickEvent(
                ChangeSupportRequest(
                  requestId: widget.requestId,
                  statusCode: "hold",
                  description: "",
                  totalAmount: 0,
                ),
              );
            }
          },
          child: Container(
            color: _availableStatus
                    .any((element) => element == SupportStatusEnum.hold)
                ? null
                : Colors.grey[200],
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
            height: 45.0,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                SvgPicture.asset(ImagePaths.hold),
                const SizedBox(width: 8),
                Text(S.of(context).hold,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: ColorSchemes.gray,
                        )),
              ],
            ),
          ),
        ),
        PopupMenuItem(
          padding: EdgeInsets.zero,
          onTap: () {
            if (_availableStatus
                .any((element) => element == SupportStatusEnum.needPayment)) {
              _bloc.add(OnNeedPaymentClickEvent());
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
            height: 45.0,
            color: _availableStatus
                    .any((element) => element == SupportStatusEnum.needPayment)
                ? null
                : Colors.grey[200],
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                SvgPicture.asset(ImagePaths.needPayment),
                const SizedBox(width: 8),
                Text(S.of(context).needPayment,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: ColorSchemes.gray)),
              ],
            ),
          ),
        ),
        PopupMenuItem(
          padding: EdgeInsets.zero,
          onTap: () {
            if (_availableStatus
                .any((element) => element == SupportStatusEnum.cancel)) {
              _onBottomCancelClickEvent(
                ChangeSupportRequest(
                  requestId: widget.requestId,
                  statusCode: "cancelled",
                  description: "",
                  totalAmount: 0,
                ),
              );
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
            height: 45.0,
            color: _availableStatus
                    .any((element) => element == SupportStatusEnum.cancel)
                ? null
                : Colors.grey[200],
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                SvgPicture.asset(ImagePaths.cancel),
                const SizedBox(width: 8),
                Text(
                  S.of(context).cancel,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: ColorSchemes.gray,
                      ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  _onBottomReceiveClickEvent(ChangeSupportRequest changeSupportRequest) {
    _bloc.add(OnBottomReceiveClickEvent(changeSupportRequest));
  }

  _onBottomStartJobClickEvent(ChangeSupportRequest changeSupportRequest) {
    _bloc.add(OnBottomStartJobClickEvent(changeSupportRequest));
  }

  _onBottomCompleteClickEvent(ChangeSupportRequest changeSupportRequest) {
    _bloc.add(OnBottomCompleteClickEvent(changeSupportRequest));
  }

  _onBottomHoldClickEvent(ChangeSupportRequest changeSupportRequest) {
    _bloc.add(OnBottomHoldClickEvent(changeSupportRequest));
  }

  _onBottomNeedPaymentClickEvent(ChangeSupportRequest changeSupportRequest) {
    _bloc.add(OnBottomNeedPaymentClickEvent(changeSupportRequest));
  }

  _onBottomCancelClickEvent(ChangeSupportRequest changeSupportRequest) {
    _bloc.add(OnBottomCancelClickEvent(changeSupportRequest));
  }

  void _showBottomSheet(BuildContext context) {
    bool isCanClose = true;
    showBottomSheetWidget(
      context: context,
      height: MediaQuery.of(context).size.height * 0.7,
      isDismissible: false,
      isPadding: false,
      content: AddPaymentBottomSheet(
        id: widget.requestId,
        onClose: (bool isClose) {
          isCanClose = isClose;
        },
      ),
      titleLabel: "",
      onClose: () {
        if (isCanClose) {
          Navigator.pop(context);
        } else {
          showActionDialogWidget(
            context: context,
            text: S.of(context).allChangesWillBeLostIfYouLeaveThisPage,
            icon: ImagePaths.warning,
            primaryAction: () {
              Navigator.pop(context);
            },
            secondaryAction: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            primaryText: S.of(context).keep,
            secondaryText: S.of(context).discard,
          );
        }
      },
    );

    // showNeedPaymentBottomSheet(
    //   context: context,
    //   maxlengthOfImages: _maxLengthOfImages,
    //   minLengthOfImages: _minLengthOfImages,
    //   maxLengthOfProblem: _maxLengthOfProblem,
    //   maxLengthOfVoice: _maxDurationOfAudio,
    //   minLengthOfProblem: _minLengthOfProblem,
    //   requestId: widget.requestId,
    //   maxLengthOfVideo: _maxDurationOfVideo,
    //   isPadding: false,
    // );
  }
}

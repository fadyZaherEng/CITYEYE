import 'dart:async';
import 'dart:io';

import 'package:city_eye/generated/l10n.dart';
import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:city_eye/src/core/base/widget/base_stateful_widget.dart';
import 'package:city_eye/src/core/resources/image_paths.dart';
import 'package:city_eye/src/core/utils/image_type_enum.dart';
import 'package:city_eye/src/core/utils/permission_service_handler.dart';
import 'package:city_eye/src/core/utils/show_action_dialog_widget.dart';
import 'package:city_eye/src/core/utils/show_bottom_sheet_upload_media.dart';
import 'package:city_eye/src/data/sources/remote/support/request/add_support_comment_request.dart';
import 'package:city_eye/src/di/injector.dart';
import 'package:city_eye/src/domain/entities/album_images/images_album.dart';
import 'package:city_eye/src/domain/entities/support/support_attachment.dart';
import 'package:city_eye/src/domain/entities/support/support_comment.dart';
import 'package:city_eye/src/domain/usecase/get_user_information_use_case.dart';
import 'package:city_eye/src/presentation/blocs/comment/comments_bloc.dart';
import 'package:city_eye/src/presentation/screens/album_images_screen/album_images_screen.dart';
import 'package:city_eye/src/presentation/screens/comment/widgets/new_message_widget.dart';
import 'package:city_eye/src/presentation/screens/comment/widgets/skelton_comments_screen.dart';
import 'package:city_eye/src/presentation/widgets/build_app_bar_widget.dart';
import 'package:city_eye/src/presentation/widgets/custom_empty_list_widget.dart';
import 'package:city_eye/src/presentation/widgets/empty_widget.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:skeletons/skeletons.dart';

class CommentsScreen extends BaseStatefulWidget {
  final int requestId;

  const CommentsScreen({
    Key? key,
    required this.requestId,
  }) : super(key: key);

  @override
  BaseState<CommentsScreen> baseCreateState() => _CommentScreenState();
}

class _CommentScreenState extends BaseState<CommentsScreen> {
  CommentsBloc get _bloc => BlocProvider.of<CommentsBloc>(context);
  final ScrollController _scrollController = ScrollController();

  List<SupportComment> _comments = [];

  @override
  void initState() {
    super.initState();
    _bloc.add(GetCommentsEvent(id: widget.requestId, showLoading: true));
  }

  File? image;

  @override
  Widget baseBuild(BuildContext context) {
    const height = 150.0;
    return BlocConsumer<CommentsBloc, CommentsState>(
      listener: (context, state) {
        if (state is ShowLoadingState) {
          showLoading();
        } else if (state is HideLoadingState) {
          hideLoading();
        } else if (state is GetCommentsSuccessState) {
          _comments = state.comments;
          if (state.comments.isNotEmpty) {
            _bloc.add(ScrollToLastIndexEvent());
          }
        } else if (state is ScrollToLastIndexState) {
          _scrollToLastIndex();
        } else if (state is GetCommentsErrorState) {
        } else if (state is OpenMediaBottomSheetState) {
          showBottomSheetUploadMedia(
              context: context,
              onTapGallery: () {
                _navigateBackEvent();
                _askForCameraPermissionEvent(
                  () {
                    _galleryPressedEvent();
                  },
                );
              },
              onTapCamera: () {
                _navigateBackEvent();
                _askForCameraPermissionEvent(
                  () {
                    _cameraPressedEvent();
                  },
                );
              });
        } else if (state is NavigateBackState) {
          Navigator.pop(context);
        } else if (state is AskForCameraPermissionState) {
          _askForCameraPermission(state.onTab);
        } else if (state is OpenCameraState) {
          _getImage(ImageSource.camera);
        } else if (state is OpenGalleryState) {
          _getImage(ImageSource.gallery);
        } else if (state is SendCommentSuccessState) {
        } else if (state is SendCommentErrorState) {}
      },
      builder: (context, state) {
        return Scaffold(
          appBar: buildAppBarWidget(
            context,
            title: S.of(context).supportRequest,
            isHaveBackButton: true,
            onBackButtonPressed: () {
              _navigateBackEvent();
            },
          ),
          body: state is ShowSkeletonState
              ? const SkeletonCommentsScreen()
              : Column(
                  children: [
                    _comments.isEmpty
                        ? Expanded(
                            child: CustomEmptyListWidget(
                              imagePath: ImagePaths.commentsEmpty,
                              text: S.of(context).noMessagesYet,
                              onRefresh: () {
                                _bloc.add(GetCommentsEvent(
                                    id: widget.requestId, showLoading: true));
                              },
                            ),
                          )
                        : Expanded(
                            child: CustomRefreshIndicator(
                              trigger: IndicatorTrigger.trailingEdge,
                              trailingScrollIndicatorVisible: false,
                              leadingScrollIndicatorVisible: true,
                              onRefresh: () async {
                                _bloc.add(GetCommentsEvent(
                                    id: widget.requestId, showLoading: false));
                              },
                              builder: (
                                BuildContext context,
                                Widget child,
                                IndicatorController controller,
                              ) {
                                return AnimatedBuilder(
                                    animation: controller,
                                    builder: (context, _) {
                                      final dy =
                                          controller.value.clamp(0.0, 1.25) *
                                              -(height - (height * 0.25));
                                      return Stack(
                                        children: [
                                          Transform.translate(
                                            offset: Offset(0.0, dy),
                                            child: child,
                                          ),
                                          Positioned(
                                            bottom: -height,
                                            left: 0,
                                            right: 0,
                                            height: height,
                                            child: Container(
                                              transform:
                                                  Matrix4.translationValues(
                                                      0.0, dy, 0.0),
                                              padding: const EdgeInsets.only(
                                                  top: 30.0),
                                              constraints:
                                                  const BoxConstraints.expand(),
                                              child: Column(
                                                children: [
                                                  if (!controller.isIdle)
                                                    Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              bottom: 8.0),
                                                      width: 16,
                                                      height: 16,
                                                      child:
                                                          const CircularProgressIndicator(
                                                        color: ColorSchemes
                                                            .primary,
                                                        strokeWidth: 2,
                                                      ),
                                                    )
                                                  else
                                                    const Icon(
                                                      Icons.keyboard_arrow_up,
                                                      color:
                                                          ColorSchemes.primary,
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    });
                              },
                              child: ListView.separated(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 16,
                                ),
                                controller: _scrollController,
                                physics: const BouncingScrollPhysics(
                                    parent: AlwaysScrollableScrollPhysics()),
                                separatorBuilder: (context, index) {
                                  return const SizedBox(height: 16);
                                },
                                itemCount: _comments.length,
                                itemBuilder: (context, index) {
                                  return SizedBox(
                                    child: Row(
                                      textDirection:
                                          _isUser(_comments[index].user.id)
                                              ? TextDirection.ltr
                                              : TextDirection.rtl,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              _isUser(_comments[index].user.id)
                                                  ? CrossAxisAlignment.start
                                                  : CrossAxisAlignment.end,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                _onNavigateToAlbumImagesScreenState(
                                                  images: _comments
                                                      .map((e) =>
                                                          SupportAttachment(
                                                            name: e.user.image
                                                                .split("/")
                                                                .last
                                                                .toString(),
                                                            pathUrl:
                                                                e.user.image,
                                                          ))
                                                      .toList(),
                                                  initialIndex: index,
                                                  context: context,
                                                );
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadiusDirectional
                                                        .circular(16.0),
                                                child: Image.network(
                                                  _comments[index].user.image,
                                                  width: 24,
                                                  height: 24,
                                                  fit: BoxFit.cover,
                                                  loadingBuilder: (context,
                                                      child, loadingProgress) {
                                                    if (loadingProgress ==
                                                        null) {
                                                      return child;
                                                    }
                                                    return const Center(
                                                      child:
                                                          CircularProgressIndicator(),
                                                    );
                                                  },
                                                  errorBuilder: (context, error,
                                                      stackTrace) {
                                                    return Center(
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadiusDirectional
                                                                .circular(16.0),
                                                        child: SvgPicture.asset(
                                                          ImagePaths.profile,
                                                          width: 24,
                                                          height: 24,
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              _comments[index].user.name,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium
                                                  ?.copyWith(
                                                    color: ColorSchemes.black,
                                                    letterSpacing: -0.13,
                                                  ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(width: 24),
                                        !_comments[index].isImage
                                            ? Expanded(
                                                child: Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 16,
                                                    vertical: 12,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: _isUser(
                                                            _comments[index]
                                                                .user
                                                                .id)
                                                        ? ColorSchemes.primary
                                                        : ColorSchemes
                                                            .commentBackground,
                                                    borderRadius: BorderRadiusDirectional.only(
                                                        topEnd: _isUser(
                                                                _comments[index]
                                                                    .user
                                                                    .id)
                                                            ? const Radius.circular(
                                                                25)
                                                            : const Radius
                                                                .circular(0),
                                                        bottomStart:
                                                            const Radius.circular(
                                                                25),
                                                        bottomEnd: const Radius
                                                            .circular(25),
                                                        topStart: _isUser(
                                                                _comments[index]
                                                                    .user
                                                                    .id)
                                                            ? const Radius.circular(0)
                                                            : const Radius.circular(25)),
                                                  ),
                                                  child: Text(
                                                    _comments[index].message,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall
                                                        ?.copyWith(
                                                          color: _isUser(
                                                                  _comments[
                                                                          index]
                                                                      .user
                                                                      .id)
                                                              ? ColorSchemes
                                                                  .white
                                                              : ColorSchemes
                                                                  .blackGrey,
                                                          letterSpacing: -0.13,
                                                        ),
                                                  ),
                                                ),
                                              )
                                            : InkWell(
                                                onTap: () {
                                                  _onNavigateToAlbumImagesScreenState(
                                                    images: _comments
                                                        .map((e) =>
                                                            SupportAttachment(
                                                              name: e.message
                                                                  .split("/")
                                                                  .last
                                                                  .toString(),
                                                              pathUrl:
                                                                  e.message,
                                                            ))
                                                        .toList(),
                                                    initialIndex: index,
                                                    context: context,
                                                  );
                                                },
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadiusDirectional
                                                          .only(
                                                    topStart:
                                                        const Radius.circular(
                                                            0),
                                                    bottomStart:
                                                        const Radius.circular(
                                                            0),
                                                    bottomEnd: _isUser(
                                                            _comments[index]
                                                                .user
                                                                .id)
                                                        ? const Radius.circular(
                                                            25)
                                                        : const Radius.circular(
                                                            0),
                                                    topEnd:
                                                        const Radius.circular(
                                                            0),
                                                  ),
                                                  child: Image.network(
                                                    _comments[index].message,
                                                    width: 150,
                                                    height: 100,
                                                    fit: BoxFit.cover,
                                                    errorBuilder: (context,
                                                        error, stackTrace) {
                                                      return ClipRRect(
                                                        borderRadius:
                                                            BorderRadiusDirectional
                                                                .only(
                                                          topStart: const Radius
                                                              .circular(0),
                                                          bottomStart:
                                                              const Radius
                                                                  .circular(0),
                                                          bottomEnd: _isUser(
                                                                  _comments[
                                                                          index]
                                                                      .user
                                                                      .id)
                                                              ? const Radius
                                                                  .circular(25)
                                                              : const Radius
                                                                  .circular(0),
                                                          topEnd: const Radius
                                                              .circular(0),
                                                        ),
                                                        child: Image.asset(
                                                          ImagePaths
                                                              .imagePlaceHolder,
                                                          width: 200,
                                                          height: 150,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      );
                                                    },
                                                    loadingBuilder: (context,
                                                        child,
                                                        loadingProgress) {
                                                      if (loadingProgress ==
                                                          null) {
                                                        return child;
                                                      }
                                                      return const Center(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.0),
                                                          child: SkeletonLine(
                                                              style:
                                                                  SkeletonLineStyle(
                                                            width: 200,
                                                            height: 100,
                                                            borderRadius:
                                                                BorderRadiusDirectional
                                                                    .all(Radius
                                                                        .circular(
                                                                            16)),
                                                          )),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      child: NewMessageWidget(
                        onAttach: () {
                          _bloc.add(MediaIconPressedEvent());
                        },
                        onSend: (message) {
                          FocusScope.of(context).unfocus();
                          _bloc.add(
                            SendCommentEvent(
                              image: "",
                              addSupportCommentRequest:
                                  AddSupportCommentRequest(
                                requestId: widget.requestId,
                                message: message,
                                isImage: false,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
        );
      },
    );
  }

  _scrollToLastIndex() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent + 1.0,
      duration: const Duration(milliseconds: 50),
      curve: Curves.bounceOut,
    );
  }

  void _navigateBackEvent() {
    _bloc.add(NavigateBackEvent());
  }

  bool _isUser(int userId) {
    return userId == injector<GetUserInformationUseCase>()().id;
  }

  void _askForCameraPermissionEvent(Function() onTab) {
    _bloc.add(AskForCameraPermissionEvent(onTab: () {
      onTab();
    }));
  }

  void _cameraPressedEvent() {
    _bloc.add(CameraPressedEvent());
  }

  void _galleryPressedEvent() {
    _bloc.add(GalleryPressedEvent());
  }

  void _askForCameraPermission(Function() onTab) async {
    bool cameraPermission = await PermissionServiceHandler()
        .handleServicePermission(setting: Permission.camera);
    if (cameraPermission) {
      onTab();
    } else {
      _showActionDialog(
        onPrimaryAction: () async {
          _navigateBackEvent();
          openAppSettings().then((value) {
            if (value == true) {
              onTab();
            }
          });
        },
        onSecondaryAction: () {
          _navigateBackEvent();
        },
        primaryText: (!mounted) ? "" : S.of(context).ok,
        secondaryText: (!mounted) ? "" : S.of(context).cancel,
        text: (!mounted) ? "" : S.of(context).youShouldHaveCameraPermission,
      );
    }
  }

  void _onNavigateToAlbumImagesScreenState({
    required List<SupportAttachment> images,
    required int initialIndex,
    required BuildContext context,
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

  Future<void> _getImage(
    ImageSource imageSource,
  ) async {
    final ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: imageSource);
    XFile? imageFile = pickedFile;
    if (pickedFile == null) {
      return;
    }
    _bloc.add(SendCommentEvent(
      image: imageFile!.path,
      addSupportCommentRequest: AddSupportCommentRequest(
        requestId: widget.requestId,
        message: "",
        isImage: true,
      ),
    ));
  }

  void _showActionDialog({
    required Function() onPrimaryAction,
    required Function() onSecondaryAction,
    required String primaryText,
    required String secondaryText,
    required String text,
  }) {
    showActionDialogWidget(
      context: context,
      text: text,
      primaryText: primaryText,
      primaryAction: () {
        onPrimaryAction();
      },
      secondaryText: secondaryText,
      secondaryAction: () {
        onSecondaryAction();
      },
      icon: "",
    );
  }
}

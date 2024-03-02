import 'package:city_eye/src/core/resources/data_state.dart';
import 'package:city_eye/src/data/sources/remote/support/request/add_support_comment_request.dart';
import 'package:city_eye/src/data/sources/remote/support/request/change_support_request.dart';
import 'package:city_eye/src/data/sources/remote/support/request/get_support_comments_request.dart';
import 'package:city_eye/src/data/sources/remote/support/request/support_details_request.dart';
import 'package:city_eye/src/domain/entities/support/media.dart';
import 'package:city_eye/src/domain/entities/support/support.dart';
import 'package:city_eye/src/domain/entities/support/support_comment.dart';

abstract interface class SupportRepository {
  Future<DataState<List<Support>>> getSupports();

  Future<DataState<Support>> getSupportDetails(
      SupportDetailsRequest supportDetailsRequest);

  Future<DataState<List<SupportComment>>> getSupportComments(
    GetSupportCommentsRequest getSupportCommentsRequest,
  );

  Future<DataState<List<SupportComment>>> addSupportComment(
      AddSupportCommentRequest addSupportCommentRequest, String image);

  Future<DataState<Support>> changeSupportStatus({
    required ChangeSupportRequest changeSupportRequest,
    required List<MediaModel> files,
  });
}

import 'dart:io';

import 'package:city_eye/src/core/resources/data_state.dart';
import 'package:city_eye/src/data/sources/remote/support/request/add_support_comment_request.dart';
import 'package:city_eye/src/domain/entities/support/support_comment.dart';
import 'package:city_eye/src/domain/repositories/support_repository.dart';

final class AddSupportCommentUseCase {
  final SupportRepository _supportRepository;

  const AddSupportCommentUseCase(this._supportRepository);

  Future<DataState<List<SupportComment>>> call(
          AddSupportCommentRequest addSupportCommentRequest,String image) async =>
      await _supportRepository.addSupportComment(addSupportCommentRequest , image);
}

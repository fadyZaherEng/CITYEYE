import 'package:city_eye/src/core/resources/data_state.dart';
import 'package:city_eye/src/data/sources/remote/support/request/get_support_comments_request.dart';
import 'package:city_eye/src/domain/entities/support/support_comment.dart';
import 'package:city_eye/src/domain/repositories/support_repository.dart';

final class GetSupportCommentsUseCase {
  final SupportRepository _supportRepository;

  const GetSupportCommentsUseCase(this._supportRepository);

  Future<DataState<List<SupportComment>>> call(
    GetSupportCommentsRequest getSupportCommentsRequest,
  ) async =>
      await _supportRepository.getSupportComments(getSupportCommentsRequest);
}

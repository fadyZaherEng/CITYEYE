import 'package:city_eye/src/core/resources/data_state.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/get_offers/request/get_offer_request.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/get_offers.dart';
import 'package:city_eye/src/domain/repositories/home_repository.dart';

final class GetOfferUseCase {
  final HomeRepository _homeRepository;

  GetOfferUseCase(this._homeRepository);

  @override
  Future<DataState<List<GetOffers>>> call({
    required GetOfferRequest request,
  }) async {
    return _homeRepository.getOffers(getOfferRequest: request);
  }
}

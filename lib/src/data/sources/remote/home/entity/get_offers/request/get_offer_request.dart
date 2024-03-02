import 'package:json_annotation/json_annotation.dart';

part 'get_offer_request.g.dart';

@JsonSerializable()
class GetOfferRequest {
  final String pageCode;

  const GetOfferRequest({
    required this.pageCode,
  });

  factory GetOfferRequest.fromJson(Map<String, dynamic> json) =>
      _$GetOfferRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetOfferRequestToJson(this);
  @override
  String toString() {
    return pageCode.toString();
  }
}

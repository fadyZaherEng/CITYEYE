import 'package:city_eye/src/domain/entities/album_images/images.dart';
import 'package:city_eye/src/domain/entities/support/support_attachment.dart';

class ImagesAlbum {
  final List<SupportAttachment> images;
  final int initialIndex;

  ImagesAlbum({required this.initialIndex, required this.images});
}

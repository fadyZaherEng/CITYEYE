import 'package:url_launcher/url_launcher.dart';

void makingPhoneCall(String phone) async {
  var url = Uri.parse("tel:$phone");
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

import 'dart:convert';

import 'package:bhaktiyoga_ios/ram/home/notify.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:http/http.dart' as http;

class DynamicLinkProvider {
  Future<String> createLink(String refCode) async {
    final String url = "https://com.bhaktiyoga.app?ref=$refCode";

    final DynamicLinkParameters parameters = DynamicLinkParameters(
        androidParameters: AndroidParameters(
            packageName: "com.bhaktiyoga.app", minimumVersion: 0),
        iosParameters: IOSParameters(
            bundleId: "com.bhaktiyoga.bhaktiapp", minimumVersion: "0"),
        link: Uri.parse(url),
        uriPrefix: "https://bhaktiyoga.page.link");

    final FirebaseDynamicLinks link = FirebaseDynamicLinks.instance;

    final refLink = await link.buildShortLink(parameters);

    return refLink.shortUrl.toString();
  }

  Future<String> shareLink(BuildContext context, String refCode) async {
    final link = await createLink(refCode);
    final message =
        """*हर हिन्दू को भगवान राम की महिमा के लिए अपने सभी संपर्कों को ये संदेश आगे भेजना चाहिए।🚩*

इस ऐप पर राम माला करने के लिए आपको कैश मिलेगा।🪷 *हम इस ऐप के माध्यम से इस राम नवमी पर 1,080,000 राम माला करने में 100,000 लोगों का योगदान लेने का लक्ष्य रखा है।📿* एक हिंदू के रूप में आप अपने धर्म की रक्षा के लिए इतना कर सकते हैं ताकि हम दुनिया को दिखा सकें कि भगवान राम सबसे महान हैं।🛕

*इंतज़ार न करें - आपको अपने प्रत्येक मित्र और रिश्तेदार को आमंत्रित करने के लिए ₹11 प्राप्त होंगे।⏩* भक्तियोग पर अभी साइन अप करें और अपना आमंत्रण लिंक प्राप्त करें - \n $link

*JAY SHRI RAM!! JAY HANUMAN!!!🙏🏻🙏🏻🙏🏻*""";
    // " am inviting you to join the Bhaktiyoga app, which can help us connect with our spirituality and achieve inner peace \n $link";
    // Share.share(message);
    return message;
  }

  void initDynamicLink(String name) async {
    final instanceLink = await FirebaseDynamicLinks.instance.getInitialLink();
    FirebaseMessaging.instance.getInitialMessage();
    FirebaseMessaging.onMessage.listen((event) {
      LocalNotificationService.display(event);
    });
    //  final String token = "f71uZyUfQf-Fk7L8VQk8E8:APA91bHJidvMsDw8iEF2ITkcmu8jJuGcpL_afvapWx-QzHEl7fbkwq63jNw5mDMkxzkVIm-QwTFA51wTBnYGKinXjhP5_RxD5Y6b_tQltV1LuEWecu34KLdWWUpPBVYyj3D8HcOkmqEp";
    //     sendNotification(token, name);
    if (instanceLink != null) {
      final Uri refLink = instanceLink.link;
      final String refCode = refLink.queryParameters["ref"].toString();
      print("This is link $refCode");

      final collection = FirebaseFirestore.instance.collection('bless');
      final querySnapshot =
          await collection.where('referCode', isEqualTo: refCode).get();

      if (querySnapshot.docs.isNotEmpty) {
        final userDoc = querySnapshot.docs.first;
        final int currentValue = userDoc.get('Blessings in account');
        final int totalbless = userDoc.get('Total Blessings Earned');

        // Replace with the name of the field you want to update
        final String token = userDoc.get('token');
        // final String token = "f71uZyUfQf-Fk7L8VQk8E8:APA91bHJidvMsDw8iEF2ITkcmu8jJuGcpL_afvapWx-QzHEl7fbkwq63jNw5mDMkxzkVIm-QwTFA51wTBnYGKinXjhP5_RxD5Y6b_tQltV1LuEWecu34KLdWWUpPBVYyj3D8HcOkmqEp";

        await userDoc.reference.update({
          'Blessings in account': currentValue + 11,
          'Total Blessings Earned': totalbless + 11,
          'Blessings Earned Invite': FieldValue.increment(11),
          'Total Invited Users': FieldValue.increment(1)
        }); // Replace with the name of the field you want to update
        sendNotification(token, name);
      }
    } else {
      print("This is link null");
    }
  }

  sendNotification(String token, String name) async {
    final data = {
      'click_action': 'FLUTTER_NOTIFICATION_CLICK',
      'id': '1',
      'status': 'done',
      'message': 'just received 11 Blessings for this good karma.',
    };

    try {
      http.Response response =
          await http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
              headers: <String, String>{
                'Content-Type': 'application/json',
                'Authorization':
                    'key=AAAA8RqRfeg:APA91bF8u7cxrUG6FnVo6u5VaPBDWEfQnXtS7OYFe2lp8QPCQGuY83xciLGJbcfj--kUpw_vfbDc-GNgPmfDU2hYBYwTy4iHRS6VNKJVYoBFCvZgqfIsaQVwP2ICXMjYsTOoMve-8kBc'
              },
              body: jsonEncode(<String, dynamic>{
                'notification': <String, dynamic>{
                  'title': name,
                  'body':
                      'just started using Bhaktiyoga.Your account just received 11 Blessings for this good karma'
                },
                'priority': 'high',
                'data': data,
                'to': '$token'
              }));

      if (response.statusCode == 200) {
        print("Yeh notificatin is sended");
      } else {
        print("Error");
      }
    } catch (e) {}
  }
}

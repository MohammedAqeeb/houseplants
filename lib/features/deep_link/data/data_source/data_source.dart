import 'dart:developer';

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

abstract interface class DeepLinkDataSource {
  Future<int?> initDeepLinks();
}

class DeepLinkDataSourceImpl implements DeepLinkDataSource {
  // ignore: deprecated_member_use
  static FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;

  @override
  Future<int?> initDeepLinks() async {
    int? id;

    // Handle the initial dynamic link when the app is opened
    final PendingDynamicLinkData? initialLink =
        // ignore: deprecated_member_use
        await dynamicLinks.getInitialLink();

    if (initialLink != null) {
      id = int.tryParse(extractData(initialLink.link) ?? '');
    }
    // ignore: deprecated_member_use
    dynamicLinks.onLink.listen((event) {
      extractData(event.link);
    }).onError((error) {
      log('dynamic link');
    });

    return id;
  }

  String? extractData(
    Uri deepLink,
  ) {
    final String? id = deepLink.queryParameters['id'];

    if (id != null) {
      return id;
    }
    return null;
  }
}

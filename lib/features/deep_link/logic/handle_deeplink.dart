// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:houseplants/core/helper/navigate.dart';
import 'package:houseplants/features/deep_link/presentation/pages/not_found.dart';

import 'package:houseplants/features/plants/data/model/plants.dart';
import 'package:houseplants/features/plants/presentation/pages/plants_detail_screen.dart';

import '../data_source/fetch_data.dart';

class HandleDeeplink {
  // To get all the plants and check wheater productId from deeplink matches with plantsId
  final GetPlants getAllPlantsDataSource;

  HandleDeeplink({required this.getAllPlantsDataSource});

  // ignore: deprecated_member_use
  static FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;

  /// Function to initialise dynamic link
  ///
  Future<void> initDeepLinks(BuildContext context) async {
    int? id;

    // Handle the initial dynamic link when the app is opened
    final PendingDynamicLinkData? initialLink =
        // ignore: deprecated_member_use
        await dynamicLinks.getInitialLink();

    // contains all List<Plants>
    final getAllPlants = await getAllPlantsDataSource.getAllPlants();

    if (initialLink != null) {
      // Extract the ID from the initial deep link
      id = _extractIdFromDeepLink(initialLink.link);
      if (id != null) {
        // Call the method to navigate with the ID
        extractData(initialLink.link, getAllPlants, id, context);
      }
    }
    // ignore: deprecated_member_use
    dynamicLinks.onLink.listen((event) {
      // Extract the ID from the initial deep link
      id = _extractIdFromDeepLink(event.link);
      if (id != null) {
        extractData(event.link, getAllPlants, id, context);
      }
    }).onError((error) {
      log('dynamic link');
    });
  }

  int? _extractIdFromDeepLink(Uri deepLink) {
    try {
      // from the deeplink obtaining the id
      final String? idStr = deepLink.queryParameters['id'];
      // Parse the ID from String to int
      return int.tryParse(idStr ?? '');
    } catch (e) {
      return null;
    }
  }

  static extractData(Uri deepLink, List<Plants> getAllPlants, int? id,
      BuildContext context) async {
    if (id != null) {
      try {
        final plant = getAllPlants.firstWhere((plant) => plant.id == id);

        // Navigate to the details page if the plant is found
        navigatePush(
          context,
          () => PlantsDetailScreen(allPlants: plant),
        );
      } catch (e) {
        // If the plant is not found, navigate to the NotFoundScreen
        navigatePush(context, () => const NotFoundScreen());
      }
    } else {
      //  plants are not yet loaded
      navigatePush(context, () => const NotFoundScreen());
    }
  }
}

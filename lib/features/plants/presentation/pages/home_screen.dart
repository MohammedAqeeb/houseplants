import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:houseplants/features/plants/presentation/bloc/get_all_plants_bloc.dart';
import 'package:houseplants/features/plants/presentation/widgets/shimmer_loader.dart';

import 'plants_preview.dart';
import '../widgets/header_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // late HandleDeepLinkUsecase handleDeepLinkUsecase;
  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    // handleDeepLinkUsecase = serviceLocator<HandleDeepLinkUsecase>();
    // handleDeepLinkUsecase.call(context);

    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    text: 'All Plants',
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                  Icon(
                    CupertinoIcons.search,
                    size: 25,
                    color: Color.fromRGBO(36, 36, 36, 1),
                  ),
                ],
              ),
              const SizedBox(height: 28),
              const TextWidget(
                text: 'Houseplants',
                fontSize: 28,
                fontWeight: FontWeight.w700,
              ),
              BlocBuilder<GetAllPlantsBloc, GetAllPlantsState>(
                builder: (context, state) {
                  if (state is GetAllPlantsInitial) {
                    return const CircularProgressIndicator();
                  } else if (state is GetAllPlantsLoading) {
                    return const ShimmerLoader();
                  } else if (state is GetAllPlantsSuccess) {
                    return PlantsPreview(plants: state.plants);
                  } else if (state is GetAllPlantsFailure) {
                    return const TextWidget(text: 'Failed To retry');
                  }
                  return const SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

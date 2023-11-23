import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import '../app_constance/app_dimensions.dart';
import '../app_constance/constants_methods.dart';
import '../app_constance/values_manager.dart';
import '../view_model/app_cubit.dart';
import '../view_model/app_state.dart';
import '../widgets/default_custom_text.dart';
import 'competitions_screen.dart';
import 'inner_screens/empty_screen.dart';

class CountriesListScreen extends StatelessWidget {
  const CountriesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Make search here'),
      ),
      body: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          AppCubit cubit = BlocProvider.of(context);
          switch (state.runtimeType) {
            case GetCountriesLoadingState:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case GetCountriesSuccessState:
              return GridView.count(
                physics: const BouncingScrollPhysics(),
                crossAxisCount: 2,
                children: List.generate(
                    cubit.countriesModel?.countries.length ?? 2, (index) {
                  return GestureDetector(
                    onTap: () {
                      GlobalMethods.navigateTo(
                          context,
                          CompetitionsScreen(
                            countryId: cubit
                                .countriesModel!.countries[index].countryId!,
                            countryName: cubit
                                .countriesModel!.countries[index].countryName!,
                          ));
                    },
                    child: Padding(
                      padding: EdgeInsets.all(AppSize.s10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CachedNetworkImage(
                            imageUrl: cubit
                                .countriesModel!.countries[index].countryLogo!,
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.grey,
                              highlightColor: Colors.grey.shade900,
                              child: Container(
                                height:
                                    AppDimensions.screenHeight(context) * 0.16,
                                margin: EdgeInsets.all(AppSize.s10),
                                decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    borderRadius:
                                        BorderRadius.circular(AppSize.s10)),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            height: AppDimensions.screenHeight(context) * 0.16,
                          ),
                          DefaultCustomText(
                            text: cubit
                                .countriesModel!.countries[index].countryName!,
                          )
                        ],
                      ),
                    ),
                  );
                }),
              );
            case GetCountriesErrorState:
              return const EmptyScreen();
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}

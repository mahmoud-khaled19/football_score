import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/view/inner_screens/competitions_screen.dart';
import '../../app_constance/app_dimensions.dart';
import '../../app_constance/constants_methods.dart';
import '../../app_constance/values_manager.dart';
import '../../view_model/app_cubit.dart';
import '../../view_model/app_state.dart';
import '../../widgets/default_custom_text.dart';
import 'empty_screen.dart';

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
                            countryId: cubit.countriesModel!.countries[index].countryId!,
                            countryName: cubit.countriesModel!.countries[index].countryName!,
                          ));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: AppDimensions.screenHeight(context) * 0.16,
                          margin: EdgeInsets.all(AppSize.s10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppSize.s10),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: cubit
                                .countriesModel!.countries[index].countryLogo!,
                          ),
                        ),
                        DefaultCustomText(
                          text: cubit
                              .countriesModel!.countries[index].countryName!,
                        )
                      ],
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

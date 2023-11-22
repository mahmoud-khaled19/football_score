import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../app_constance/constants_methods.dart';
import '../view/inner_screens/countries_list.dart';
import '../view_model/app_cubit.dart';
import '../view_model/app_state.dart';
import 'default_list_tile.dart';

class DefaultDrawerWidget extends StatelessWidget {
  const DefaultDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        AppCubit cubit = BlocProvider.of(context);
        return Drawer(
          child: Column(
            children: [
              const DrawerHeader(
                child: null,
              ),
              DefaultListTile(
                title: 'Countries Screen',
                function: () {
                  GlobalMethods.navigateTo(
                    context,
                    const CountriesListScreen(),
                  );
                },
              )
            ],
          ),
        );
      },
    );
  }
}

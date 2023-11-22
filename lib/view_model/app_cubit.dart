import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/app_constance/constants_methods.dart';
import 'package:football_app/model/competitions_model.dart';
import 'package:football_app/model/standings_model.dart';
import 'package:football_app/model/top_scorer_model.dart';
import 'package:football_app/view/inner_screens/team_details.dart';
import '../app_constance/api_constance.dart';
import '../model/countries_model.dart';
import '../model/team_model.dart';
import 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  AppCubit get(context) => BlocProvider.of(context);
  CountriesModel? countriesModel;
  CompetitionsModel? competitionsModel;
  StandingModel? standingModel;
  TeamModel? teamModel;
  PlayerModel? playerModel;

  Future getCountries() async {
    emit(GetCountriesLoadingState());
    await Dio().get(ApiConstance.getCountriesEndPoint).then((value) {
      countriesModel = CountriesModel.fromJson(value.data);

      emit(GetCountriesSuccessState());
    }).catchError((error) {
      log(error.toString());
      emit(GetCountriesErrorState());
    });
  }

  Future getCompetitions(
    String? countryId,
  ) async {
    emit(GetCompetitionsLoadingState());
    await Dio()
        .get(ApiConstance.getLeagues(countryId: countryId))
        .then((value) {
      competitionsModel = CompetitionsModel.fromJson(value.data);
      emit(GetCompetitionsSuccessState());
    }).catchError((error) {
      log(error.toString());
      emit(GetCompetitionsErrorState());
    });
  }

  Future getStandings({required String? leagueId}) async {
    emit(GetStandingsLoadingState());
    await Dio()
        .get(ApiConstance.getStandings(leagueId: leagueId))
        .then((value) {
      standingModel = StandingModel.fromJson(value.data);
      emit(GetStandingsSuccessState());
    }).catchError((error) {
      log(error.toString());
      emit(GetStandingsErrorState());
    });
  }

  Future getTeamDetails({required String? teamId, context}) async {
    emit(GetTeamLoadingState());
    await Dio().get(ApiConstance.getTeams(teamId: teamId)).then((value) {
      teamModel = TeamModel.fromJson(value.data);
      GlobalMethods.navigateTo(context, const TeamDetails());
      emit(GetTeamSuccessState());
    }).catchError((error) {
      log(error.toString());
      emit(GetTeamErrorState());
    });
  }

  Future getTopScorer({required String? leagueId}) async {
    emit(GetTopScorerLoadingState());
    log(leagueId!);
    await Dio()
        .get(ApiConstance.getTopScorer(
      leagueId: leagueId,
    ))
        .then((value) {
      playerModel = PlayerModel.fromJson(value.data);
      emit(GetTopScorerSuccessState());
    }).catchError((error) {
      log(error.toString());
      emit(GetTopScorerErrorState());
    });
  }
}

class CompetitionsModel {
  final List<Competitions> competitions;

  CompetitionsModel({required this.competitions});

  factory CompetitionsModel.fromJson(List<dynamic> json) {
    List<Competitions> competitions =
        json.map((data) => Competitions.fromJson(data)).toList();
    return CompetitionsModel(competitions: competitions);
  }
}

class Competitions {
  String? countryId, countryLogo, countryName;
  String? leagueId, leagueLogo, leagueName, leagueSeason;

  Competitions.fromJson(Map<String, dynamic> json) {
    countryId = json["country_id"];
    countryName = json["country_name"];
    countryLogo = json["country_logo"];
    leagueId = json["league_id"];
    leagueName = json["league_name"];
    leagueLogo = json["league_logo"];
    leagueSeason = json["league_season"];
  }
}

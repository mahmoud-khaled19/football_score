class StandingModel {
  final List<Standings>standing;

  StandingModel({required this.standing});

  factory StandingModel.fromJson(List<dynamic>json){
    List<Standings> standing =
    json.map((data) => Standings.fromJson(data)).toList();
    return StandingModel(standing: standing);
  }
}

class Standings {
  String? leagueId;
  String? teamId;
  String? teamName;
  String? teamPlayedMatches;
  String? teamPromotion;
  String? teamPosition;
  String? teamWinGames;
  String? teamDrawGames;
  String? teamLoseGames;
  String? teamPoints;
  String? teamGoalsScored;
  String? teamGoalsReceives;
  String? teamLogo;

  Standings.fromJson(Map<String, dynamic> json) {
    leagueId = json['league_id'];
    teamId = json['team_id'];
    teamName = json['team_name'];
    teamPromotion = json['overall_promotion'];
    teamPosition = json['overall_league_position'];
    teamPlayedMatches = json['overall_league_payed'];
    teamWinGames = json['overall_league_W'];
    teamDrawGames = json['overall_league_D'];
    teamLoseGames = json['overall_league_L'];
    teamPoints = json['overall_league_PTS'];
    teamGoalsScored = json['overall_league_GF'];
    teamGoalsReceives = json['overall_league_GA'];
    teamLogo = json['team_badge'];
  }
}

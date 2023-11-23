class ApiConstance {
  static String basicUrl = 'https://apiv3.apifootball.com/?action';
  static String basicApi =
      'APIkey=5e47b5079f6261c27e37589658a27af0bcc2ca411bb3036089cc02706d66d60f';
  static String getCountriesEndPoint = '$basicUrl=get_countries&$basicApi';

  static String getLeagues({String? countryId}) {
    String countryParam = countryId != null ? '&country_id=$countryId' : '';
    return '$basicUrl=get_leagues&$countryParam&$basicApi';
  }

  static String getStandings({String? leagueId}) {
    String id = leagueId != null ? '&league_id=$leagueId' : '';
    return '$basicUrl=get_standings&league_id=$id&$basicApi';
  }

  static String getTopScorer({String? leagueId}) {
    String id = leagueId != null ? 'league_id=$leagueId' : '';
    return '$basicUrl=get_topscorers&league_id=$leagueId&$basicApi';
  }
  // $basicUrl=get_topscorers&league_id=$id=5e47b5079f6261c27e37589658a27af0bcc2ca411bb3036089cc02706d66d60f

  static String getTeams({String? teamId}) {
    String id = teamId != null ? '&league_id=$teamId' : '';
    return '$basicUrl=get_leagues&league_id=$id&$basicApi';
  }

  static String getPlayer({String? id}) {
    String playerId = id != null ? '&player_id=$id' : '';

    return '$basicUrl=get_players&player_id=$playerId&$basicApi';
  }
}

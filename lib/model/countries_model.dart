class CountriesModel {
  final List<Country> countries;

  CountriesModel({required this.countries});

  factory CountriesModel.fromJson(List<dynamic> json) {
    List<Country> countries =
        json.map((data) => Country.fromJson(data)).toList();
    return CountriesModel(countries: countries);
  }
}

class Country {
  String? countryName, countryId, countryLogo;

  Country.fromJson(Map<String, dynamic> json) {
    countryId = json["country_id"];
    countryName = json["country_name"];
    countryLogo = json["country_logo"];
  }
}

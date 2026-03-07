import 'package:chat_app/model/country_model.dart';

//source for emojis : https://emojiterra.com/country-flags/

class CountryData {
  final List<CountryModel> countries = [
    CountryModel(name: "Canada", code: "+1", flag: "🇨🇦"),
    CountryModel(name: "China", code: "+86", flag: "🇨🇳"),
    CountryModel(name: "Italy", code: "+39", flag: "🇮🇹"),
    CountryModel(name: "Japan", code: "+81", flag: "🇯🇵"),
    CountryModel(name: "Mexico", code: "+52", flag: "🇲🇽"),
    CountryModel(name: "Philippines", code: "+63", flag: "🇵🇭"),
    CountryModel(name: "Singapore", code: "+65", flag: "🇸🇬"),
    CountryModel(name: "South Korea", code: "+82", flag: "🇰🇷"),
    CountryModel(name: "United States", code: "+1", flag: "🇺🇸"),
  ];
}

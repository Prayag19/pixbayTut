class Strings {
  static Strings? _instance;

  Strings._();

  static Strings get instance => _instance ??= Strings._();


  //Strings.instance.
  //=================================================Error Strings ==========================//
  String errorFailed = "Failed";
  String errorUnknownError = "Unknown Error";
  String errorUnknownErrorMsg = "Something went Wrong,\nTry after some time";
  String errorNetwork = "Network Error";



}

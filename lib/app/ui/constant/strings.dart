class Strings {
  static Strings? _instance;

  Strings._();

  static Strings get instance => _instance ??= Strings._();

  String textSearch = "Search";
  String textLoading = "Loading";
  String textEndOfResults=  "End of Results";
  String textNoRecords=  "No Records";

  //Strings.instance.
  //=================================================Error Strings ==========================//
  String errorFailed = "Failed";
  String errorUnknownError = "Unknown Error";
  String errorError = "Error";
  String errorRetry = "Retry";
  String errorUnknownErrorMsg = "Something went Wrong,\nTry after some time";
  String errorNetwork = "Network Error";



}

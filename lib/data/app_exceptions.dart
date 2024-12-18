class AppExceptions implements Exception
{
  final dynamic _message;
  final dynamic _prefix;

  AppExceptions([this._message, this._prefix]);

  @override
  String toString()
  {
    return "$_prefix $_message";
  }
}

class InternetExceptions extends AppExceptions
{
  InternetExceptions([String ? message]) : super(message, "No Internet");
}

class RequestTimeOut extends AppExceptions
{
  RequestTimeOut([String ? message]) : super(message, "Request Time Out");
}

class ServerException extends AppExceptions
{
  ServerException([String ? message]) : super(message, "Server Issue");
}

class InvalidUrlException extends AppExceptions
{
  InvalidUrlException([String ? message]) : super(message, "Url is not valid");
}

class CommunicationException extends AppExceptions
{
  CommunicationException([String ? message]) : super(message, "Error occured while communication");
}


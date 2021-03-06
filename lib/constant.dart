///
/// The Bitly V4 API follows the more standard REST convention of utilizing
/// the HTTP response codes to identify the status of the response.
/// These include, but are not limited to [StatusCode]
///
class StatusCode {
  static const SUCCESS = 200;
  static const CREATED = 201;
  static const BAD_REQUEST = 400;
  static const FORBIDDEN = 401;
  static const EXPECTATION_FAILED = 417;
  static const UNPROCESSABLE_ENTITY = 422;
  static const INTERNAL_ERROR = 500;
  static const TEMPORARILY_UNAVAILABLE = 503;
}

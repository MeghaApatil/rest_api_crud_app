class Urls {
  static const String baseUrl = 'https://api.nstack.in/';
  static const String postUrl = '${baseUrl}v1/todos';
  static const String getUrl = 'https://api.nstack.in/v1/todos?page=1&limit=20';
  static const String deleteUrl = '$postUrl/';// by id
    static const String updateUrl = '$postUrl/';// by id

}

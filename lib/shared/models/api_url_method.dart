class ApiUrlMethod {
  String baseUrl;
  String path;
  String httpMethod;
  dynamic body;

  ApiUrlMethod({
    this.baseUrl,
    this.path = '',
    this.httpMethod,
    this.body,
  });

  String get url => "$baseUrl$path";

  @override
  String toString() => url;
}

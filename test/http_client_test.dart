import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:wayve_test_app/core/api/http_client.dart';


void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");


  Dio tDio = Dio();
  final dioAdapterMock = DioAdapter(dio: tDio);

  setUp(() async {
    tDio = await HttpHelper.getTestInstance;
    tDio.httpClientAdapter = dioAdapterMock;
  });

  group('Get requests', () {
    String path = "https://example.com";

    test('testing the get method', () async {
      final responsePayload = {"response_code": "1000"};

      dioAdapterMock.onGet(
        path,
            (request) {
          return request.reply(200, responsePayload);
        },
        data: null,
        queryParameters: {},
        headers: {},
      );

      final response = await tDio.get(path);
      final expected = {"response_code": "1000"};

      expect(response.data, expected);
    });
  });
}
import 'package:flutter_bloc_example/core/network/network_info.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class MockInternetConnectionChecker extends Mock implements InternetConnectionChecker {}

void main() {
  late NetworkInfoImpl networkInfo;
  late MockInternetConnectionChecker mockInternetConnectionChecker;

  setUp(() {
    mockInternetConnectionChecker = MockInternetConnectionChecker();
    networkInfo = NetworkInfoImpl(mockInternetConnectionChecker);
  });

  group('is connected', () {
    // test('Should forward internet connection checker', () async {
    //   print("mockInternetConnectionChecker.hasConnection:-- ${mockInternetConnectionChecker.hasConnection}");
    //   when(mockInternetConnectionChecker.hasConnection).thenAnswer((_) async => true);
    //   final result = await networkInfo.isConnected;
    //
    //   verify(mockInternetConnectionChecker.hasConnection);
    //   expect(result, true);
    // });
    test('''Unawaited call hasConnection should return a Future<bool>''', () {
      expect(
        InternetConnectionChecker().hasConnection,
        isA<Future<bool>>(),
      );
    });

    test(
        '''Unawaited call to connectionStatus '''
        '''should return a Future<InternetConnectionStatus>''', () {
      expect(
        InternetConnectionChecker().connectionStatus,
        isA<Future<InternetConnectionStatus>>(),
      );
    });
  });
}

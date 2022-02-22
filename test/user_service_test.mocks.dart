// Mocks generated by Mockito 5.1.0 from annotations
// in wayve_test_app/test/user_service_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:wayve_test_app/core/api/http_client.dart' as _i2;
import 'package:wayve_test_app/features/user_status/data/services/user_service.dart'
    as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeHttpHelper_0 extends _i1.Fake implements _i2.HttpHelper {}

/// A class which mocks [UserServiceImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserServiceImpl extends _i1.Mock implements _i3.UserServiceImpl {
  MockUserServiceImpl() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.HttpHelper get httpHelper =>
      (super.noSuchMethod(Invocation.getter(#httpHelper),
          returnValue: _FakeHttpHelper_0()) as _i2.HttpHelper);
  @override
  set httpHelper(_i2.HttpHelper? _httpHelper) =>
      super.noSuchMethod(Invocation.setter(#httpHelper, _httpHelper),
          returnValueForMissingStub: null);
  @override
  _i4.Future<dynamic> getUsers({String? url}) =>
      (super.noSuchMethod(Invocation.method(#getUsers, [], {#url: url}),
          returnValue: Future<dynamic>.value()) as _i4.Future<dynamic>);
}

/// A class which mocks [HttpHelper].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpHelper extends _i1.Mock implements _i2.HttpHelper {
  MockHttpHelper() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<dynamic> get(String? route,
          {List<int>? successStatusCodes = const [200, 201],
          dynamic onError,
          bool? overrideBaseUrl = false}) =>
      (super.noSuchMethod(
          Invocation.method(#get, [
            route
          ], {
            #successStatusCodes: successStatusCodes,
            #onError: onError,
            #overrideBaseUrl: overrideBaseUrl
          }),
          returnValue: Future<dynamic>.value()) as _i4.Future<dynamic>);
  @override
  void dispose() => super.noSuchMethod(Invocation.method(#dispose, []),
      returnValueForMissingStub: null);
}

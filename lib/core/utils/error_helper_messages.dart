import 'dart:math';

List<String> _genericErrorMessages = [
  'Something went wrong. we are currently investigating why. Please try again later',
  'Oops! This operation was unsuccessful, please try again later',
  'Your network is quite unstable, please try again later',
  'Oops, something went wrong. Please contact support',
  'The server encountered an error processing the request. Please, try again later.'
];

String get genericErrorMessageString {
  int _max = _genericErrorMessages.length;
  int _rand = Random().nextInt(_max);
  return _genericErrorMessages[_rand];
}
///Helper function to handle errors and execute actions
///using try-catch, avoid repeating code
///
/// *[action]*: Future function to execute
/// *[onError]*: Un callback when there is an error
Future<void> executeAction({
  required Future<void> Function() action,
  required void Function(Object error, StackTrace stackTrace) onError,
}) async {
  try {
    await action();
  } catch (e, s) {
    onError(e, s);
  }
}
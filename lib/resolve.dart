T? resolve<T>(Map<String, dynamic> json, String path) {
  final parts = path.split('.');
  dynamic current = json;
  for (final part in parts) {
    if (current is! Map<String, dynamic>) {
      return null;
    }
    current = current[part];
  }
  if (current is! T?) {
    return null;
  }
  return current;
}

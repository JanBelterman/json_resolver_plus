import 'package:intl/intl.dart';
import 'package:json_resolver_plus/json_resolver_plus.dart';

extension JsonMapWithResolve on Map<String, dynamic> {
  T? value<T>(String path) {
    return JsonResolver.value<T>(this, path);
  }

  bool? boolean(String path) {
    return JsonResolver.boolean(this, path);
  }

  int? integer(String path) {
    return JsonResolver.integer(this, path);
  }

  double? number(String path) {
    return JsonResolver.number(this, path);
  }

  String? string(String path) {
    return JsonResolver.string(this, path);
  }

  DateTime? dateTime(String path, [DateFormat? format]) {
    return JsonResolver.dateTime(this, path, format);
  }

  int? tryInt(String path) {
    return JsonResolver.tryInt(this, path);
  }

  double? tryDouble(String path) {
    return JsonResolver.tryDouble(this, path);
  }
}

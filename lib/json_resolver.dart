import 'package:intl/intl.dart';
import 'package:json_resolver_plus/resolve.dart';
import 'package:json_resolver_plus/utils.dart';

class JsonResolver {
  static T? value<T>(Map<String, dynamic> json, String path) {
    return resolve<T>(json, path);
  }

  static bool? boolean(Map<String, dynamic> json, String path) {
    return resolve<bool>(json, path);
  }

  static int? integer(Map<String, dynamic> json, String path) {
    return resolve<int>(json, path);
  }

  static double? number(Map<String, dynamic> json, String path) {
    return resolve<double>(json, path);
  }

  static String? string(Map<String, dynamic> json, String path) {
    return resolve<String>(json, path);
  }

  static DateTime? dateTime(Map<String, dynamic> json, String path, [DateFormat? format]) {
    final val = resolve(json, path);
    if (val is DateTime) {
      return val;
    } else if (val is String) {
      if (format == null) {
        return DateTime.tryParse(val);
      }
      return format.tryParse(val);
    }
    return null;
  }

  static int? tryInt(Map<String, dynamic> json, String path) {
    final val = resolve(json, path);
    if (val is int) {
      return val;
    } else if (val is String) {
      return int.tryParse(val);
    } else if (val is double) {
      return val.toInt();
    }
    return null;
  }

  static double? tryDouble(Map<String, dynamic> json, String path) {
    final val = resolve(json, path);
    if (val is double) {
      return val;
    } else if (val is String) {
      return double.tryParse(val);
    } else if (val is int) {
      return val.toDouble();
    }
    return null;
  }
}

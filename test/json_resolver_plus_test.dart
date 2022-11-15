import 'package:flutter_test/flutter_test.dart';

import 'package:json_resolver_plus/json_resolver_plus.dart';

void main() {
  test('Path resolves correctly', () {
    final json = {
      'a': {
        'b': {
          'c': 42,
        },
      },
    };
    expect(resolve(json, 'a.b.c'), 42);
    expect(resolve(json, 'a.b.d'), null);
  });
  test('Value types resolve correctly', () {
    final json = {
      'a': {
        'b': {
          'c': 42,
          'd': '42',
          'e': 42.0,
          'f': 'Hello World',
        },
      },
    };
    expect(resolve<int>(json, 'a.b.c'), 42);
    expect(resolve<int>(json, 'a.b.d'), null);
    expect(resolve<int>(json, 'a.b.e'), null);
    expect(resolve<int>(json, 'a.b.f'), null);
  });
  test('TryInt resolves correctly', () {
    final json = {
      'a': {
        'b': {
          'c': 42,
          'd': '42',
          'e': 42.0,
          'f': 'Hello World',
        },
      },
    };
    expect(JsonResolver.tryInt(json, 'a.b.c'), 42);
    expect(JsonResolver.tryInt(json, 'a.b.d'), 42);
    expect(JsonResolver.tryInt(json, 'a.b.e'), 42);
    expect(JsonResolver.tryInt(json, 'a.b.f'), null);
  });
  test('TryDouble resolve correctly', () {
    final json = {
      'a': {
        'b': {
          'c': 42.6,
          'd': '42.6',
          'e': 'Hello World',
          'f': 42,
        },
      },
    };
    expect(JsonResolver.tryDouble(json, 'a.b.c'), 42.6);
    expect(JsonResolver.tryDouble(json, 'a.b.d'), 42.6);
    expect(JsonResolver.tryDouble(json, 'a.b.e'), null);
    expect(JsonResolver.tryDouble(json, 'a.b.f'), 42.0);
  });

  test('DateTime resolve correctly', () {
    final json = {
      'a': {
        'b': {
          'c': '2022-11-15 15:00:00',
        },
      },
    };
    expect(json.dateTime('a.b.c'), isA<DateTime>());
  });
}

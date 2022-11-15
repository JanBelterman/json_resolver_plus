# Json resolver plus

Access nested json LIKE a PRO!

## Features

* Easy access nested json properties
* Easy type checking
* Automatic casting included e.g. '42.6' > 42.6
* Extend easily with dart extensions

## Usage

### Simple usage

```dart
final json = {
    'a': {
        'b': {
            'c': 42
        },
    },
};

export 'package:json_resolver_plus/resolve.dart';
resolve(json, 'a.b.d'); // null
resolve(json, 'a.b.c'); // 42
resolve<int>(json, 'a.b.c'); // 42
resolve<String>(json, 'a.b.c'); // null
```

### More advanced

```dart
final json = {
    'a': {
        'b': {
            'c': true,
            'd': 42
            'e': 42.624,
            'f': 'Hello World!',
            'g': '2022-11-15 15:00:00'
        },
    },
};

export 'package:json_resolver_plus/json_resolver.dart';
JsonResolver.value(json, 'a.b.c'); // true
JsonResolver.value<bool>(json, 'a.b.c'); // true
JsonResolver.boolean(json, 'a.b.c'); // true
JsonResolver.integer(json, 'a.b.d'); // 42
JsonResolver.number(json, 'a.b.e'); // 42.624
JsonResolver.string(json, 'a.b.f'); // Hello World!

export 'package:json_resolver_plus/json_map_with_resolve.dart';
json.value('a.b.c'); // true
json.value<bool>('a.b.c'); // true
json.boolean('a.b.c'); // true
json.integer('a.b.d'); // 42
json.number('a.b.e'); // 42.624
json.string('a.b.f'); // Hello World!
json.dateTime('a.b.g'); // DateTime
json.dateTime('a.b.g', format: DateFormat('yyyy-MM-dd HH:mm')); // DateTime
```

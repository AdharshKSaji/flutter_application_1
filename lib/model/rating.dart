import 'package:collection/collection.dart';
import 'package:flutter/src/widgets/basic.dart';

class Rating {
  double? rate;
  int? count;

  Rating({this.rate, this.count});

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: (json['rate'] as num?)?.toDouble(),
        count: json['count'] as int?,
      );

  bool? get isNotEmpty => null;

  bool? get isEmpty => null;

  Map<String, dynamic> toJson() => {
        'rate': rate,
        'count': count,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Rating) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => rate.hashCode ^ count.hashCode;

  map(Padding Function(dynamic product) param0) {}
}
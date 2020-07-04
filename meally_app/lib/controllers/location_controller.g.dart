// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ControllerLocation on ControllerLocationBase, Store {
  final _$originAtom = Atom(name: 'ControllerLocationBase.origin');

  @override
  String get origin {
    _$originAtom.reportRead();
    return super.origin;
  }

  @override
  set origin(String value) {
    _$originAtom.reportWrite(value, super.origin, () {
      super.origin = value;
    });
  }

  final _$destinationAtom = Atom(name: 'ControllerLocationBase.destination');

  @override
  String get destination {
    _$destinationAtom.reportRead();
    return super.destination;
  }

  @override
  set destination(String value) {
    _$destinationAtom.reportWrite(value, super.destination, () {
      super.destination = value;
    });
  }

  final _$distanceAtom = Atom(name: 'ControllerLocationBase.distance');

  @override
  String get distance {
    _$distanceAtom.reportRead();
    return super.distance;
  }

  @override
  set distance(String value) {
    _$distanceAtom.reportWrite(value, super.distance, () {
      super.distance = value;
    });
  }

  final _$durationAtom = Atom(name: 'ControllerLocationBase.duration');

  @override
  String get duration {
    _$durationAtom.reportRead();
    return super.duration;
  }

  @override
  set duration(String value) {
    _$durationAtom.reportWrite(value, super.duration, () {
      super.duration = value;
    });
  }

  final _$calculateETAAsyncAction =
      AsyncAction('ControllerLocationBase.calculateETA');

  @override
  Future calculateETA(String destination) {
    return _$calculateETAAsyncAction.run(() => super.calculateETA(destination));
  }

  @override
  String toString() {
    return '''
origin: ${origin},
destination: ${destination},
distance: ${distance},
duration: ${duration}
    ''';
  }
}

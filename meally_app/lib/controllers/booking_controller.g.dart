// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ControllerBooking on ControllerBookingBase, Store {
  final _$restaurantAtom = Atom(name: 'ControllerBookingBase.restaurant');

  @override
  Restaurant get restaurant {
    _$restaurantAtom.reportRead();
    return super.restaurant;
  }

  @override
  set restaurant(Restaurant value) {
    _$restaurantAtom.reportWrite(value, super.restaurant, () {
      super.restaurant = value;
    });
  }

  final _$qtdPessoasAtom = Atom(name: 'ControllerBookingBase.qtdPessoas');

  @override
  int get qtdPessoas {
    _$qtdPessoasAtom.reportRead();
    return super.qtdPessoas;
  }

  @override
  set qtdPessoas(int value) {
    _$qtdPessoasAtom.reportWrite(value, super.qtdPessoas, () {
      super.qtdPessoas = value;
    });
  }

  final _$dateTimeAtom = Atom(name: 'ControllerBookingBase.dateTime');

  @override
  DateTime get dateTime {
    _$dateTimeAtom.reportRead();
    return super.dateTime;
  }

  @override
  set dateTime(DateTime value) {
    _$dateTimeAtom.reportWrite(value, super.dateTime, () {
      super.dateTime = value;
    });
  }

  final _$bookingAtom = Atom(name: 'ControllerBookingBase.booking');

  @override
  String get booking {
    _$bookingAtom.reportRead();
    return super.booking;
  }

  @override
  set booking(String value) {
    _$bookingAtom.reportWrite(value, super.booking, () {
      super.booking = value;
    });
  }

  final _$areaAtom = Atom(name: 'ControllerBookingBase.area');

  @override
  String get area {
    _$areaAtom.reportRead();
    return super.area;
  }

  @override
  set area(String value) {
    _$areaAtom.reportWrite(value, super.area, () {
      super.area = value;
    });
  }

  final _$fumantesAtom = Atom(name: 'ControllerBookingBase.fumantes');

  @override
  bool get fumantes {
    _$fumantesAtom.reportRead();
    return super.fumantes;
  }

  @override
  set fumantes(bool value) {
    _$fumantesAtom.reportWrite(value, super.fumantes, () {
      super.fumantes = value;
    });
  }

  final _$carrinhoAtom = Atom(name: 'ControllerBookingBase.carrinho');

  @override
  List<Menu> get carrinho {
    _$carrinhoAtom.reportRead();
    return super.carrinho;
  }

  @override
  set carrinho(List<Menu> value) {
    _$carrinhoAtom.reportWrite(value, super.carrinho, () {
      super.carrinho = value;
    });
  }

  @override
  String toString() {
    return '''
restaurant: ${restaurant},
qtdPessoas: ${qtdPessoas},
dateTime: ${dateTime},
booking: ${booking},
area: ${area},
fumantes: ${fumantes},
carrinho: ${carrinho}
    ''';
  }
}

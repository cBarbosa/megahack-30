// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ControllerCheckout on ControllerCheckoutBase, Store {
  final _$publicKeyAtom = Atom(name: 'ControllerCheckoutBase.publicKey');

  @override
  String get publicKey {
    _$publicKeyAtom.reportRead();
    return super.publicKey;
  }

  @override
  set publicKey(String value) {
    _$publicKeyAtom.reportWrite(value, super.publicKey, () {
      super.publicKey = value;
    });
  }

  final _$preferenceIdAtom = Atom(name: 'ControllerCheckoutBase.preferenceId');

  @override
  String get preferenceId {
    _$preferenceIdAtom.reportRead();
    return super.preferenceId;
  }

  @override
  set preferenceId(String value) {
    _$preferenceIdAtom.reportWrite(value, super.preferenceId, () {
      super.preferenceId = value;
    });
  }

  final _$isLoadingAtom = Atom(name: 'ControllerCheckoutBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$statusAtom = Atom(name: 'ControllerCheckoutBase.status');

  @override
  String get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(String value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$getPreferenceIdAsyncAction =
      AsyncAction('ControllerCheckoutBase.getPreferenceId');

  @override
  Future getPreferenceId(User user, List<Product> products) {
    return _$getPreferenceIdAsyncAction
        .run(() => super.getPreferenceId(user, products));
  }

  final _$checkoutAsyncAction = AsyncAction('ControllerCheckoutBase.checkout');

  @override
  Future checkout() {
    return _$checkoutAsyncAction.run(() => super.checkout());
  }

  @override
  String toString() {
    return '''
publicKey: ${publicKey},
preferenceId: ${preferenceId},
isLoading: ${isLoading},
status: ${status}
    ''';
  }
}

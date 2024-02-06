// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DetailsController on _DetailsControllerBase, Store {
  late final _$detailsAtom =
      Atom(name: '_DetailsControllerBase.details', context: context);

  @override
  DetailsModel? get details {
    _$detailsAtom.reportRead();
    return super.details;
  }

  @override
  set details(DetailsModel? value) {
    _$detailsAtom.reportWrite(value, super.details, () {
      super.details = value;
    });
  }

  late final _$statusAtom =
      Atom(name: '_DetailsControllerBase.status', context: context);

  @override
  DetailsFetchState get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(DetailsFetchState value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  late final _$_apiErrorAtom =
      Atom(name: '_DetailsControllerBase._apiError', context: context);

  @override
  String get _apiError {
    _$_apiErrorAtom.reportRead();
    return super._apiError;
  }

  bool __apiErrorIsInitialized = false;

  @override
  set _apiError(String value) {
    _$_apiErrorAtom.reportWrite(
        value, __apiErrorIsInitialized ? super._apiError : null, () {
      super._apiError = value;
      __apiErrorIsInitialized = true;
    });
  }

  late final _$controllerStartAsyncAction =
      AsyncAction('_DetailsControllerBase.controllerStart', context: context);

  @override
  Future<void> controllerStart() {
    return _$controllerStartAsyncAction.run(() => super.controllerStart());
  }

  @override
  String toString() {
    return '''
details: ${details},
status: ${status}
    ''';
  }
}

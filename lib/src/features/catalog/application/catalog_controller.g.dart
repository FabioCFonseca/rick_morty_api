// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CatalogController on _CatalogControllerBase, Store {
  late final _$catalogAtom =
      Atom(name: '_CatalogControllerBase.catalog', context: context);

  @override
  ObservableList<CatalogModel> get catalog {
    _$catalogAtom.reportRead();
    return super.catalog;
  }

  @override
  set catalog(ObservableList<CatalogModel> value) {
    _$catalogAtom.reportWrite(value, super.catalog, () {
      super.catalog = value;
    });
  }

  late final _$favoritesAtom =
      Atom(name: '_CatalogControllerBase.favorites', context: context);

  @override
  ObservableList<CatalogModel> get favorites {
    _$favoritesAtom.reportRead();
    return super.favorites;
  }

  @override
  set favorites(ObservableList<CatalogModel> value) {
    _$favoritesAtom.reportWrite(value, super.favorites, () {
      super.favorites = value;
    });
  }

  late final _$_apiErrorAtom =
      Atom(name: '_CatalogControllerBase._apiError', context: context);

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

  late final _$statusAtom =
      Atom(name: '_CatalogControllerBase.status', context: context);

  @override
  CatalogState get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  bool _statusIsInitialized = false;

  @override
  set status(CatalogState value) {
    _$statusAtom.reportWrite(value, _statusIsInitialized ? super.status : null,
        () {
      super.status = value;
      _statusIsInitialized = true;
    });
  }

  late final _$currentPageAtom =
      Atom(name: '_CatalogControllerBase.currentPage', context: context);

  @override
  int get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  late final _$controllerStartAsyncAction =
      AsyncAction('_CatalogControllerBase.controllerStart', context: context);

  @override
  Future<void> controllerStart() {
    return _$controllerStartAsyncAction.run(() => super.controllerStart());
  }

  late final _$_CatalogControllerBaseActionController =
      ActionController(name: '_CatalogControllerBase', context: context);

  @override
  void toggleFavorite({CatalogModel? character}) {
    final _$actionInfo = _$_CatalogControllerBaseActionController.startAction(
        name: '_CatalogControllerBase.toggleFavorite');
    try {
      return super.toggleFavorite(character: character);
    } finally {
      _$_CatalogControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPage(int page) {
    final _$actionInfo = _$_CatalogControllerBaseActionController.startAction(
        name: '_CatalogControllerBase.setPage');
    try {
      return super.setPage(page);
    } finally {
      _$_CatalogControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
catalog: ${catalog},
favorites: ${favorites},
status: ${status},
currentPage: ${currentPage}
    ''';
  }
}

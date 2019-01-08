part of '../core.dart';

mixin ObservableListMixin<T> implements List<Observable<T>> {
  final _atom = createAtom(name: 'ObservableArray');
  final _list = <Observable<T>>[];

  @override
  Observable<T> get first {
    _atom.reportObserved();
    return _list.first;
  }

  @override
  set first(Observable<T> value) {
    _list.first = value;
    _atom.reportChanged();
  }

  @override
  Observable<T> get last {
    _atom.reportObserved();
    return _list.last;
  }

  @override
  set last(Observable<T> value) {
    _list.last = value;
    _atom.reportChanged();
  }

  @override
  int get length {
    _atom.reportObserved();
    return _list.length;
  }

  @override
  set length(int value) {
    _list.length = value;
    _atom.reportChanged();
  }

  @override
  List<Observable<T>> operator +(List<Observable<T>> other) {
    final newList = _list + other;
    _atom.reportObserved();

    return newList;
  }

  @override
  Observable<T> operator [](int index) {
    _atom.reportObserved();
    return _list[index];
  }

  @override
  void operator []=(int index, Observable<T> value) {
    final oldValue = _list[index];

    if (oldValue != value) {
      _list[index] = value;
      _atom.reportChanged();
    }
  }

  @override
  void add(Observable<T> value) {
    _list.add(value);
    _atom.reportChanged();
  }

  @override
  void addAll(Iterable<Observable<T>> iterable) {
    _list.addAll(iterable);
    _atom.reportChanged();
  }

  @override
  bool any(bool Function(Observable<T> element) test) {
    _atom.reportObserved();
    return _list.any(test);
  }

  @override
  Map<int, Observable<T>> asMap() {
    _atom.reportObserved();
    return _list.asMap();
  }

  @override
  List<R> cast<R>() {
    _atom.reportObserved();
    return _list.cast<R>();
  }

  @override
  void clear() {
    _list.clear();
    _atom.reportChanged();
  }

  @override
  bool contains(Object element) {
    _atom.reportObserved();
    return _list.contains(element);
  }

  @override
  Observable<T> elementAt(int index) {
    _atom.reportObserved();
    return _list.elementAt(index);
  }

  @override
  bool every(bool Function(Observable<T> element) test) {
    _atom.reportObserved();
    return _list.every(test);
  }

  @override
  Iterable<U> expand<U>(Iterable<U> Function(Observable<T> element) f) {
    _atom.reportObserved();
    return _list.expand(f);
  }

  @override
  void fillRange(int start, int end, [Observable<T> fillValue]) {
    _list.fillRange(start, end, fillValue);
    _atom.reportChanged();
  }

  @override
  Observable<T> firstWhere(bool Function(Observable<T> element) test,
      {Observable<T> Function() orElse}) {
    _atom.reportObserved();
    return _list.firstWhere(test, orElse: orElse);
  }

  @override
  U fold<U>(U initialValue,
      U Function(U previousValue, Observable<T> element) combine) {
    _atom.reportObserved();
    return _list.fold(initialValue, combine);
  }

  @override
  Iterable<Observable<T>> followedBy(Iterable<Observable<T>> other) {
    _atom.reportObserved();
    return _list.followedBy(other);
  }

  @override
  void forEach(void Function(Observable<T> element) f) {
    _atom.reportObserved();
    _list.forEach(f);
  }

  @override
  Iterable<Observable<T>> getRange(int start, int end) {
    _atom.reportObserved();
    return _list.getRange(start, end);
  }

  @override
  int indexOf(Observable<T> element, [int start = 0]) {
    _atom.reportObserved();
    return _list.indexOf(element, start);
  }

  @override
  int indexWhere(bool Function(Observable<T> element) test, [int start = 0]) {
    _atom.reportObserved();
    return _list.indexWhere(test, start);
  }

  @override
  void insert(int index, Observable<T> element) {
    _list.insert(index, element);
    _atom.reportChanged();
  }

  @override
  void insertAll(int index, Iterable<Observable<T>> iterable) {
    _list.insertAll(index, iterable);
    _atom.reportChanged();
  }

  @override
  bool get isEmpty {
    _atom.reportObserved();
    return _list.isEmpty;
  }

  @override
  bool get isNotEmpty {
    _atom.reportObserved();
    return _list.isNotEmpty;
  }

  @override
  Iterator<Observable<T>> get iterator {
    _atom.reportObserved();
    return _list.iterator;
  }

  @override
  String join([String separator = '']) {
    _atom.reportObserved();
    return _list.join(separator);
  }

  @override
  int lastIndexOf(Observable<T> element, [int start]) {
    _atom.reportObserved();
    return _list.lastIndexOf(element, start);
  }

  @override
  int lastIndexWhere(bool Function(Observable<T> element) test, [int start]) {
    _atom.reportObserved();
    return _list.lastIndexWhere(test, start);
  }

  @override
  Observable<T> lastWhere(bool Function(Observable<T> element) test,
      {Observable<T> Function() orElse}) {
    _atom.reportObserved();
    return _list.lastWhere(test, orElse: orElse);
  }

  @override
  Iterable<U> map<U>(U Function(Observable<T> e) f) {
    _atom.reportObserved();
    return _list.map(f);
  }

  @override
  Observable<T> reduce(
      Observable<T> Function(Observable<T> value, Observable<T> element)
          combine) {
    _atom.reportObserved();
    return _list.reduce(combine);
  }

  @override
  bool remove(Object value) {
    final didRemove = _list.remove(value);
    _atom.reportChanged();

    return didRemove;
  }

  @override
  Observable<T> removeAt(int index) {
    final value = _list.removeAt(index);
    _atom.reportChanged();

    return value;
  }

  @override
  Observable<T> removeLast() {
    final value = _list.removeLast();
    _atom.reportChanged();

    return value;
  }

  @override
  void removeRange(int start, int end) {
    _list.removeRange(start, end);
    _atom.reportChanged();
  }

  @override
  void removeWhere(bool Function(Observable<T> element) test) {
    _list.removeWhere(test);
    _atom.reportChanged();
  }

  @override
  void replaceRange(int start, int end, Iterable<Observable<T>> replacement) {
    _list.replaceRange(start, end, replacement);
    _atom.reportChanged();
  }

  @override
  void retainWhere(bool Function(Observable<T> element) test) {
    _list.retainWhere(test);
    _atom.reportChanged();
  }

  @override
  Iterable<Observable<T>> get reversed {
    _atom.reportObserved();
    return _list.reversed;
  }

  @override
  void setAll(int index, Iterable<Observable<T>> iterable) {
    _list.setAll(index, iterable);
    _atom.reportChanged();
  }

  @override
  void setRange(int start, int end, Iterable<Observable<T>> iterable,
      [int skipCount = 0]) {
    _list.setRange(start, end, iterable, skipCount);
    _atom.reportChanged();
  }

  @override
  void shuffle([Random random]) {
    _list.shuffle(random);
    _atom.reportChanged();
  }

  @override
  Observable<T> get single {
    _atom.reportObserved();
    return _list.single;
  }

  @override
  Observable<T> singleWhere(bool Function(Observable<T> element) test,
      {Observable<T> Function() orElse}) {
    _atom.reportObserved();
    return _list.singleWhere(test, orElse: orElse);
  }

  @override
  Iterable<Observable<T>> skip(int count) {
    _atom.reportObserved();
    return _list.skip(count);
  }

  @override
  Iterable<Observable<T>> skipWhile(bool Function(Observable<T> value) test) {
    _atom.reportObserved();
    return _list.skipWhile(test);
  }

  @override
  void sort([int Function(Observable<T> a, Observable<T> b) compare]) {
    _list.sort(compare);
    _atom.reportChanged();
  }

  @override
  List<Observable<T>> sublist(int start, [int end]) {
    _atom.reportObserved();
    return _list.sublist(start, end);
  }

  @override
  Iterable<Observable<T>> take(int count) {
    _atom.reportObserved();
    return _list.take(count);
  }

  @override
  Iterable<Observable<T>> takeWhile(bool Function(Observable<T> value) test) {
    _atom.reportObserved();
    return _list.takeWhile(test);
  }

  @override
  List<Observable<T>> toList({bool growable = true}) {
    _atom.reportObserved();
    return _list.toList(growable: growable);
  }

  @override
  Set<Observable<T>> toSet() {
    _atom.reportObserved();
    return _list.toSet();
  }

  @override
  Iterable<Observable<T>> where(bool Function(Observable<T> element) test) {
    _atom.reportObserved();
    return _list.where(test);
  }

  @override
  Iterable<U> whereType<U>() {
    _atom.reportObserved();
    return _list.whereType<U>();
  }
}

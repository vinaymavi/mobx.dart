import 'package:mobx/mobx.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'shared_mocks.dart';

void main() {
  test('Basic observable<T>', () {
    final x = observable<int>(null);
    expect(x.value, equals(null));

    x.value = 100;
    expect(x.value, equals(100));

    expect(x.name, startsWith('Observable@'));

    final str = observable('hello', name: 'greeting');
    expect(str is Observable<String>, isTrue);
    expect(str.value, equals('hello'));
    expect(str.name, equals('greeting'));

    str.value = 'mobx';
    expect(str.value, equals('mobx'));
  });

  test('Raw observables', () {
    final x = Observable(currentContext, 1000);
    expect(x is Observable<int>, isTrue);

    expect(x.value, equals(1000));

    final x1 = Observable<int>(currentContext, null);
    expect(x1.value, isNull);

    final y = Observable(currentContext, 'Hello', name: 'greeting');
    expect(y.value, equals('Hello'));
    expect(y.name, equals('greeting'));
  });

  test('createAtom works', () {
    var executionCount = 0;
    final a = createAtom(
        name: 'test',
        onObserved: () {
          executionCount++;
        },
        onUnobserved: () {
          executionCount++;
        });

    final d = autorun((_) {
      a.reportObserved();
    });

    expect(executionCount, equals(1)); // onBecomeObserved gets called

    d();
    expect(executionCount, equals(2)); // onBecomeUnobserved gets called
  });

  test('createAtom provides a default name', () {
    final a = createAtom();

    expect(a.name, startsWith('Atom@'));
  });

  test('observable uses provided context', () {
    final context = MockContext();
    final value = observable(0, context: context)..value += 1;

    verify(context.startBatch());
    verify(context.propagateChanged(value));
    verify(context.endBatch());
  });
}

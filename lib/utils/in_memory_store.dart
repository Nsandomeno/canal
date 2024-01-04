import 'package:rxdart/rxdart.dart';
/// an in-memory store backed by BehaviorSubject that can
/// be used to store the data for all the mock repositories.
class InMemoryStore<T> {
  InMemoryStore(T initial) : _subject = BehaviorSubject<T>.seeded(initial);
  // the BehaviorSubject that holds the data
  final BehaviorSubject<T> _subject;
  // the output stream that can be used to listen to the data (and changes)
  Stream<T> get stream => _subject.stream;

  // a sync getter for the current value
  T get value => _subject.value;

  // a setter for updating the value
  set value(T value) => _subject.add(value);

  // [ !!! ] must be called when done
  void close() => _subject.close();
}


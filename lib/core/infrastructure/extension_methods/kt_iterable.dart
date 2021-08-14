import 'package:kt_dart/collection.dart';

extension KtIterableX<T> on KtIterable<T> {
  KtList<T> replace(T oldElement, T newElement) {
    final index = indexOf(oldElement);

    return replaceAt(index, newElement);
  }

  KtList<T> replaceAt(int index, T element) {
    final list = mutableListFrom(iter);
    list[index] = element;

    return list;
  }
}

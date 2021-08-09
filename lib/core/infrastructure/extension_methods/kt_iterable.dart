import 'package:kt_dart/collection.dart';

extension KtIterableX<T> on KtIterable<T> {
  KtList<T> replaceAt(int index, T element) {
    final list = mutableListFrom(iter);
    list[index] = element;

    return list;
  }
}

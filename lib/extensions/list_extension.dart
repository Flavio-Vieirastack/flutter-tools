extension ListExtension on List {
  void replaceAll<T>(Iterable<T> list) {
    clear();
    addAll(list);
  }
}

class StackDS<E> {
  final List<E> _stack = [];

  bool get isEmpty {
    return _stack.isEmpty;
  }

  int get size {
    return _stack.length;
  }

  void push(E element) {
    _stack.add(element);
  }

  void clear() {
    _stack.clear();
  }

  E? pop() {
    if (!isEmpty) {
      return _stack.removeLast();
    }

    return null;
  }

  E? peek() {
    if (!isEmpty) {
      return _stack.last;
    }

    return null;
  }
}

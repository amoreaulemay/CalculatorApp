class Queue<E> {
  final List<E> _queue = [];

  bool get isEmpty {
    return _queue.isEmpty;
  }

  int get size {
    return _queue.length;
  }

  void queue(E newElement) {
    _queue.add(newElement);
  }

  E? dequeue() {
    if (isEmpty) {
      return null;
    }
    return _queue.removeAt(0);
  }

  E? peek() {
    if (isEmpty) {
      return null;
    }

    return _queue[0];
  }
}

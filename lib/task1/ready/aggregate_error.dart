class AggregateError {
  List<Object> errors = List.empty(growable: true);
  String? message;

  AggregateError();
  AggregateError.withErrors(this.errors);
  AggregateError.withMessage(this.message);
  AggregateError.withMessageAndErrors(this.message, this.errors);

  void addError(Object err) => errors.add(err);

  bool isEmpty() => errors.isEmpty;

  @override
  String toString() {
    StringBuffer result = StringBuffer();
    if (message != null) {
      result.write(message!);
    }
    for (Object err in errors) {
      result.write(" $err");
    }
    return result.toString();
  }
  
}
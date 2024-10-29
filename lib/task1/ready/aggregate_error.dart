class AggregateError {
  List<Object> errors;
  String? message;

  AggregateError(this.errors);
  AggregateError.withMessageAndErrors(this.message, this.errors);

  void addError(Object err) {
    errors.add(err);
  }

  bool isEmpty() => errors.isEmpty;

  @override
  String toString() {
    StringBuffer result = StringBuffer();
    if (message != null) {
      result.write(message!);
    }
    for (Object err in errors) {
      result.write("\n$err");
    }
    return result.toString();
  }
  
}
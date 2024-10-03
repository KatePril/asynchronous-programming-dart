class AggregateError {
  List<Exception> errors = List.empty();

  AggregateError();
  AggregateError.withErrors(this.errors);

  void addError(Exception err) => errors.add(err);

  String toString() {
    String result = "";
    for (Exception err in errors) {
      result += "$err ";
    }
    return result;
  }
  
}
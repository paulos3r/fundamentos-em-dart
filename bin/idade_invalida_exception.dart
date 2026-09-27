class IdadeInvalidaException implements Exception {
  final String mensagem;

  IdadeInvalidaException(this.mensagem);

  @override
  String toString() => mensagem;
}
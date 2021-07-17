class UnrecognizedConfigurationError extends Error {
  final String configurationId;

  UnrecognizedConfigurationError(this.configurationId);

  @override
  String toString() {
    final explanation = 'The Configuration with id: $configurationId was not recognized. Terminating.';
    return Error.safeToString(explanation);
  }
}

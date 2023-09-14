enum VerificationMethod {
  mobile('Mobile Verification'),
  email('Email Verification');

  const VerificationMethod(this.name);
  final String name;

  @override
  String toString() => name;
}

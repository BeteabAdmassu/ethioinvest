class AuthState {
  final bool isAuthenticated;
  final String? userId;
  final String? email;
  final String? name;
  final String? errorMessage;

  AuthState({
    required this.isAuthenticated,
    this.userId,
    this.email,
    this.name,
    this.errorMessage,
  });

  AuthState copyWith({
    bool? isAuthenticated,
    String? userId,
    String? email,
    String? name,
    String? errorMessage,
  }) {
    return AuthState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      userId: userId ?? this.userId,
      email: email ?? this.email,
      name: name ?? this.name,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
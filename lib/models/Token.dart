
class Token {
  String access_token;
  int expires_in;

  Token({this.access_token, this.expires_in});

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
        access_token: json['access_token'],
        expires_in: json['expires_in']);
  }

  Map<String, dynamic> toJson() => {
    'access_token': access_token,
    'expires_in': expires_in
  };
}
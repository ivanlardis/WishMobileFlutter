class WishInfo {
  WishInfo(
      {this.countUserCons,
      this.countAllProps,
      this.countUserProps,
      this.countAllCons});

  factory WishInfo.fromJson(Map<String, dynamic> json) {
    return WishInfo(
        countUserCons: json['countUserCons'],
        countAllProps: json['countAllProps'],
        countUserProps: json['countUserProps'],
        countAllCons: json['countAllCons']);
  }

  Map<String, dynamic> toJson() => {
        'countUserCons': countUserCons,
        'countAllProps': countAllProps,
        'countUserProps': countUserProps,
        'countAllCons': countAllCons
      };
  int countUserCons = 0;
  int countAllProps = 0;
  int countUserProps = 0;
  int countAllCons = 0;
}

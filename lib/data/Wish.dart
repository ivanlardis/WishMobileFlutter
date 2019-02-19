

class Wish {
  int timeAfterLastPress = 0;
  int countCons = 0;
  int countProps = 0;

  Wish({this.timeAfterLastPress, this.countCons, this.countProps});

  factory Wish.fromJson(Map<String, dynamic> json) {
    return Wish(
        timeAfterLastPress: json['timeAfterLastPress'],
        countCons: json['countCons'],
        countProps: json['countProps']);
  }

  Map<String, dynamic> toJson() => {
        'timeAfterLastPress': timeAfterLastPress,
        'countProps': countProps,
        'countCons': countCons
      };
}

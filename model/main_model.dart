class Main {
  int? temp;
  int? pressure;
  int? humidity;

  Main({
    this.temp,
    this.pressure,
    this.humidity,
  });

  Main.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    pressure = json['pressure'];
    humidity = json['humidity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['temp'] = temp;
    data['pressure'] = pressure;
    data['humidity'] = humidity;
    return data;
  }
}

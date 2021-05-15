class ErrorMessage {
  String type;
  String title;
  int status;
  String detail;
  String traceId;

  ErrorMessage({this.type, this.title, this.status, this.detail, this.traceId});

  ErrorMessage.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    title = json['title'];
    status = json['status'];
    detail = json['detail'];
    traceId = json['traceId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['title'] = this.title;
    data['status'] = this.status;
    data['detail'] = this.detail;
    data['traceId'] = this.traceId;
    return data;
  }
}

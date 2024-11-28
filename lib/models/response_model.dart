class FetchResponse {
  Map<String, dynamic>? data;
  String? error;

  FetchResponse({
    this.data,
    this.error,
  });

  fromJson(Map<String, dynamic> json) {
    if (json["data"] != null) {
      data = json["data"] as Map<String, dynamic>;
    }
    if (json["error"] != null) {
      error = json["error"] as String;
    }
    return this;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resp = <String, dynamic>{};
    resp["data"] = data;
    resp["error"] = error;
    return resp;
  }
}

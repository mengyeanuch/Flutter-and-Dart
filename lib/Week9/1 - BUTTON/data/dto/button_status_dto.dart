import '../../model/button_status.dart';

class ButtonStatusDto {
  static final String nameKey = "title";
  static final String selectedKey = "selected";

  static ButtonStatus fromJson(Map<String, dynamic> json) {
    assert(json[nameKey] is String);
    assert(json[selectedKey] is bool);

    String name = json[nameKey];
    bool selected = json[selectedKey];

    return ButtonStatus(name: name, selected: selected);
  }

  static Map<String, dynamic> toJson(ButtonStatus buttonStatus) {
    return {nameKey: buttonStatus.name, selectedKey: buttonStatus.selected};
  }
}

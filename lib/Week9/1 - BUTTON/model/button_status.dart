class ButtonStatus {
  final String name;
  final bool selected;

  ButtonStatus({required this.name, required this.selected});

  @override
  String toString() => 'ButtonStatus(name: $name, selected: $selected)';
}

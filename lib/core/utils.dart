extension StringExtension on String {
  String toPascal() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}

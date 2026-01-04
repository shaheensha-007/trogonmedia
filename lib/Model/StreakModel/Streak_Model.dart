class StreakModel {
  final int currentDay;
  final List<StreakDay> days;

  StreakModel({required this.currentDay, required this.days});

  factory StreakModel.fromJson(Map<String, dynamic> json) {
    return StreakModel(
      currentDay: json['current_day'],
      days: (json['days'] as List).map((i) => StreakDay.fromJson(i)).toList(),
    );
  }
}

class StreakDay {
  final int id;
  final int dayNumber;
  final String label;
  final bool isCompleted;
  final bool isCurrent;
  final String topicTitle;
  final List<Module> modules;

  StreakDay({
    required this.id,
    required this.dayNumber,
    required this.label,
    required this.isCompleted,
    required this.isCurrent,
    required this.topicTitle,
    required this.modules,
  });

  factory StreakDay.fromJson(Map<String, dynamic> json) {
    return StreakDay(
      id: json['id'],
      dayNumber: json['day_number'],
      label: json['label'],
      isCompleted: json['is_completed'],
      isCurrent: json['is_current'],
      topicTitle: json['topic']['title'],
      modules: (json['topic']['modules'] as List)
          .map((m) => Module.fromJson(m))
          .toList(),
    );
  }
}

class Module {
  final String name;
  final String description;

  Module({required this.name, required this.description});

  factory Module.fromJson(Map<String, dynamic> json) {
    return Module(
      name: json['name'],
      description: json['description'],
    );
  }
}
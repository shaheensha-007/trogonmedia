class HomeModel {
  HomeModel({
      this.user, 
      this.heroBanners, 
      this.activeCourse, 
      this.popularCourses, 
      this.liveSession, 
      this.community, 
      this.testimonials, 
      this.support,});

  HomeModel.fromJson(dynamic json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    if (json['hero_banners'] != null) {
      heroBanners = [];
      json['hero_banners'].forEach((v) {
        heroBanners?.add(HeroBanners.fromJson(v));
      });
    }
    activeCourse = json['active_course'] != null ? ActiveCourse.fromJson(json['active_course']) : null;
    if (json['popular_courses'] != null) {
      popularCourses = [];
      json['popular_courses'].forEach((v) {
        popularCourses?.add(PopularCourses.fromJson(v));
      });
    }
    liveSession = json['live_session'] != null ? LiveSession.fromJson(json['live_session']) : null;
    community = json['community'] != null ? Community.fromJson(json['community']) : null;
    if (json['testimonials'] != null) {
      testimonials = [];
      json['testimonials'].forEach((v) {
        testimonials?.add(Testimonials.fromJson(v));
      });
    }
    support = json['support'] != null ? Support.fromJson(json['support']) : null;
  }
  User? user;
  List<HeroBanners>? heroBanners;
  ActiveCourse? activeCourse;
  List<PopularCourses>? popularCourses;
  LiveSession? liveSession;
  Community? community;
  List<Testimonials>? testimonials;
  Support? support;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) {
      map['user'] = user?.toJson();
    }
    if (heroBanners != null) {
      map['hero_banners'] = heroBanners?.map((v) => v.toJson()).toList();
    }
    if (activeCourse != null) {
      map['active_course'] = activeCourse?.toJson();
    }
    if (popularCourses != null) {
      map['popular_courses'] = popularCourses?.map((v) => v.toJson()).toList();
    }
    if (liveSession != null) {
      map['live_session'] = liveSession?.toJson();
    }
    if (community != null) {
      map['community'] = community?.toJson();
    }
    if (testimonials != null) {
      map['testimonials'] = testimonials?.map((v) => v.toJson()).toList();
    }
    if (support != null) {
      map['support'] = support?.toJson();
    }
    return map;
  }

}

class Support {
  Support({
      this.title, 
      this.description, 
      this.exampleQuestion, 
      this.illustration, 
      this.actions,});

  Support.fromJson(dynamic json) {
    title = json['title'];
    description = json['description'];
    exampleQuestion = json['example_question'];
    illustration = json['illustration'];
    if (json['actions'] != null) {
      actions = [];
      json['actions'].forEach((v) {
        actions?.add(Actions.fromJson(v));
      });
    }
  }
  String? title;
  String? description;
  String? exampleQuestion;
  String? illustration;
  List<Actions>? actions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['description'] = description;
    map['example_question'] = exampleQuestion;
    map['illustration'] = illustration;
    if (actions != null) {
      map['actions'] = actions?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Actions {
  Actions({
      this.type, 
      this.label, 
      this.icon,});

  Actions.fromJson(dynamic json) {
    type = json['type'];
    label = json['label'];
    icon = json['icon'];
  }
  String? type;
  String? label;
  String? icon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['label'] = label;
    map['icon'] = icon;
    return map;
  }

}

class Testimonials {
  Testimonials({
      this.id, 
      this.learner, 
      this.review, 
      this.isActive,});

  Testimonials.fromJson(dynamic json) {
    id = json['id'];
    learner = json['learner'] != null ? Learner.fromJson(json['learner']) : null;
    review = json['review'];
    isActive = json['is_active'];
  }
  int? id;
  Learner? learner;
  String? review;
  bool? isActive;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (learner != null) {
      map['learner'] = learner?.toJson();
    }
    map['review'] = review;
    map['is_active'] = isActive;
    return map;
  }

}

class Learner {
  Learner({
      this.name, 
      this.avatar,});

  Learner.fromJson(dynamic json) {
    name = json['name'];
    avatar = json['avatar'];
  }
  String? name;
  String? avatar;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['avatar'] = avatar;
    return map;
  }

}

class Community {
  Community({
      this.id, 
      this.name, 
      this.activeMembers, 
      this.description, 
      this.recentActivity, 
      this.action,});

  Community.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    activeMembers = json['active_members'];
    description = json['description'];
    recentActivity = json['recent_activity'] != null ? RecentActivity.fromJson(json['recent_activity']) : null;
    action = json['action'];
  }
  int? id;
  String? name;
  int? activeMembers;
  String? description;
  RecentActivity? recentActivity;
  String? action;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['active_members'] = activeMembers;
    map['description'] = description;
    if (recentActivity != null) {
      map['recent_activity'] = recentActivity?.toJson();
    }
    map['action'] = action;
    return map;
  }

}

class RecentActivity {
  RecentActivity({
      this.recentPosts, 
      this.status, 
      this.recentMembers,});

  RecentActivity.fromJson(dynamic json) {
    recentPosts = json['recent_posts'];
    status = json['status'];
    if (json['recent_members'] != null) {
      recentMembers = [];
      json['recent_members'].forEach((v) {
        recentMembers?.add(RecentMembers.fromJson(v));
      });
    }
  }
  int? recentPosts;
  String? status;
  List<RecentMembers>? recentMembers;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['recent_posts'] = recentPosts;
    map['status'] = status;
    if (recentMembers != null) {
      map['recent_members'] = recentMembers?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class RecentMembers {
  RecentMembers({
      this.id, 
      this.avatar,});

  RecentMembers.fromJson(dynamic json) {
    id = json['id'];
    avatar = json['avatar'];
  }
  int? id;
  String? avatar;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['avatar'] = avatar;
    return map;
  }

}

class LiveSession {
  LiveSession({
      this.id, 
      this.isLive, 
      this.title, 
      this.instructor, 
      this.sessionDetails, 
      this.action,});

  LiveSession.fromJson(dynamic json) {
    id = json['id'];
    isLive = json['is_live'];
    title = json['title'];
    instructor = json['instructor'] != null ? Instructor.fromJson(json['instructor']) : null;
    sessionDetails = json['session_details'] != null ? SessionDetails.fromJson(json['session_details']) : null;
    action = json['action'];
  }
  int? id;
  bool? isLive;
  String? title;
  Instructor? instructor;
  SessionDetails? sessionDetails;
  String? action;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['is_live'] = isLive;
    map['title'] = title;
    if (instructor != null) {
      map['instructor'] = instructor?.toJson();
    }
    if (sessionDetails != null) {
      map['session_details'] = sessionDetails?.toJson();
    }
    map['action'] = action;
    return map;
  }

}

class SessionDetails {
  SessionDetails({
      this.sessionNumber, 
      this.date, 
      this.time,});

  SessionDetails.fromJson(dynamic json) {
    sessionNumber = json['session_number'];
    date = json['date'];
    time = json['time'];
  }
  int? sessionNumber;
  String? date;
  String? time;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['session_number'] = sessionNumber;
    map['date'] = date;
    map['time'] = time;
    return map;
  }

}

class Instructor {
  Instructor({
      this.name,});

  Instructor.fromJson(dynamic json) {
    name = json['name'];
  }
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    return map;
  }

}

class PopularCourses {
  PopularCourses({
      this.id, 
      this.name, 
      this.courses,});

  PopularCourses.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    if (json['courses'] != null) {
      courses = [];
      json['courses'].forEach((v) {
        courses?.add(Courses.fromJson(v));
      });
    }
  }
  int? id;
  String? name;
  List<Courses>? courses;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    if (courses != null) {
      map['courses'] = courses?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Courses {
  Courses({
      this.id, 
      this.title, 
      this.image, 
      this.action,});

  Courses.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    action = json['action'];
  }
  int? id;
  String? title;
  String? image;
  String? action;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['image'] = image;
    map['action'] = action;
    return map;
  }

}

class ActiveCourse {
  ActiveCourse({
      this.id, 
      this.title, 
      this.progress, 
      this.testsCompleted, 
      this.totalTests,});

  ActiveCourse.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    progress = json['progress'];
    testsCompleted = json['tests_completed'];
    totalTests = json['total_tests'];
  }
  int? id;
  String? title;
  int? progress;
  int? testsCompleted;
  int? totalTests;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['progress'] = progress;
    map['tests_completed'] = testsCompleted;
    map['total_tests'] = totalTests;
    return map;
  }

}

class HeroBanners {
  HeroBanners({
      this.id, 
      this.title, 
      this.image, 
      this.isActive,});

  HeroBanners.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    isActive = json['is_active'];
  }
  int? id;
  String? title;
  String? image;
  bool? isActive;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['image'] = image;
    map['is_active'] = isActive;
    return map;
  }

}

class User {
  User({
      this.name, 
      this.greeting, 
      this.streak,});

  User.fromJson(dynamic json) {
    name = json['name'];
    greeting = json['greeting'];
    streak = json['streak'] != null ? Streak.fromJson(json['streak']) : null;
  }
  String? name;
  String? greeting;
  Streak? streak;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['greeting'] = greeting;
    if (streak != null) {
      map['streak'] = streak?.toJson();
    }
    return map;
  }

}

class Streak {
  Streak({
      this.days, 
      this.icon,});

  Streak.fromJson(dynamic json) {
    days = json['days'];
    icon = json['icon'];
  }
  int? days;
  String? icon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['days'] = days;
    map['icon'] = icon;
    return map;
  }

}
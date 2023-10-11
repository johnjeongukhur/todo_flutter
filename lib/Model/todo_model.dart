import 'dart:ffi';

class TodoListResponse {
  final String description;
  final String title;
  final bool complete;
  final int onwerId;
  final int priority;
  final int id;
  final String createdAt;

  TodoListResponse(
      {required this.description
        , required this.title
        , required this.complete
        , required this.onwerId
        , required this.priority
        , required this.id
        , required this.createdAt});

  factory TodoListResponse.fromJson(Map<String, dynamic> json) {
    return TodoListResponse(
        description: json['description'] ?? ''
        , title: json['title'] ?? ''
        , complete: json['complete'] ?? false
        , onwerId: json['onwer_id'] ?? 0
        , priority: json['priority'] ?? 1
        , id: json['id'] ?? 0
        , createdAt: json['created_at'] ?? '');
  }
}
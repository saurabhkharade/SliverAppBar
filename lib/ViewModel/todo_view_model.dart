import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutterdemo/Model/todo_model.dart';
import 'package:flutterdemo/Utils/Utils.dart';
import 'package:http/http.dart' as http;

class TodoViewModel with ChangeNotifier {
  List<TodoModel> _todolist = [];

  bool _isLoading = false;

  List<TodoModel> get todos => _todolist;

  bool get isLoading => _isLoading;

  Future<void> fetchTodos() async {
    _isLoading = true;

    notifyListeners();

    final url = Uri.parse("${Utils().URL_BASE}/todos");

    try {
      final response = await http.get(url);
      print(response.body);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        _todolist = data.map((json) => TodoModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load data!');
      }
    } catch (error) {
      print(error);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

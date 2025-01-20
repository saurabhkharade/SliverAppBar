import 'package:flutter/material.dart';
import 'package:flutterdemo/ViewModel/todo_view_model.dart';
import 'package:provider/provider.dart';

class SilverAppBarDemo extends StatelessWidget {
  const SilverAppBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoViewModel()..fetchTodos(),
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: Consumer<TodoViewModel>(builder: (context, viewModel, child) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                actions: <Widget>[],
                flexibleSpace: FlexibleSpaceBar(
                    title: Text('Todo'),
                    background: Image.asset("assets/todo_sliver_app_bar.jpg",
                        fit: BoxFit.cover)),
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                ),
              ),
              viewModel.isLoading
                  ? SliverFillRemaining(
                      child: Center(child: CircularProgressIndicator()),
                    )
                  : SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final todo = viewModel.todos[index];
                          return Dismissible(
                            key: Key(todo.id.toString()),
                            background: Container(
                              color: Colors.green,
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Icon(Icons.archive, color: Colors.white),
                            ),
                            secondaryBackground: Container(
                              color: Colors.red,
                              alignment: Alignment.centerRight,
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Icon(Icons.delete, color: Colors.white),
                            ),
                            onDismissed: (direction) {
                              if (direction == DismissDirection.startToEnd) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text("Archived successfully" ,style: TextStyle(fontWeight: FontWeight.bold),),
                                ));
                              } else if (direction ==
                                  DismissDirection.endToStart) {
                                // Delete action
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                            Text("Deleted successfully")));
                              }
                            },
                            child: Card(
                              margin: EdgeInsets.all(8),
                              color: Colors.white,
                              child: ListTile(
                                leading: Icon(
                                  todo.completed
                                      ? Icons.check_circle
                                      : Icons.circle_outlined,
                                  color: todo.completed
                                      ? Colors.green
                                      : Colors.grey,
                                ),
                                title: Text(
                                  todo.title,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                subtitle: Text('Id: ${todo.id}'),
                              ),
                            ),
                          );
                        },
                        childCount: viewModel.todos.length,
                      ),
                    ),
            ],
          );
        }),
      ),
    );
  }
}

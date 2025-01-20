Flutter MVVM App with SliverAppBar, Swipe Actions, and Dynamic List
This Flutter application demonstrates the implementation of the MVVM (Model-View-ViewModel) architecture using the Provider package. The app features a SliverAppBar, a dynamic list of items, and swipe actions to archive or delete items.

Features
SliverAppBar: An app bar that integrates seamlessly with scrolling content, providing a native scrolling experience.
Dynamic List: A list that allows users to add new items dynamically.
Swipe Actions: Swipe left to delete an item and swipe right to archive an item, implemented using the Dismissible widget.
MVVM Architecture: Separation of concerns by dividing the app into Model, View, and ViewModel layers, enhancing code maintainability and testability.
Visual Representation:
lib/
├── models/
│   └── todo_model.dart
├── Ui/
│   └── SilverAppBarDemo.dart
├── Utils/
│   └── Utils.dart
└── ViewModel/
└── todo_view_model.dart
├── main.dart


Implementation Details
SliverAppBar
The SliverAppBar provides a flexible app bar that can expand, collapse, and float as the user scrolls. This is achieved by wrapping the main content in a CustomScrollView and adding the SliverAppBar as a sliver.

Dynamic List with Swipe Actions
Each item in the list is wrapped with the Dismissible widget to enable swipe actions. Swiping left deletes the item, while swiping right archives it. The ItemViewModel manages the list of items and notifies listeners of any changes.


MVVM Architecture with Provider
The app uses the Provider package to manage state and implement the MVVM architecture. The ItemViewModel extends ChangeNotifier and is provided to the widget tree using ChangeNotifierProvider. The ItemListView consumes the ItemViewModel and rebuilds when the list of items changes.

This README provides an overview of the Flutter application, including its features, setup instructions, project structure, and implementation details. For more information, please refer to the source code and the provided references.


![Screenshot_20250120_154358](https://github.com/user-attachments/assets/ac00e04c-8805-4a15-b0be-754d98cdff14)

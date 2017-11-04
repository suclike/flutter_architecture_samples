import 'dart:async';

import 'package:flutter_driver/flutter_driver.dart';
import '../utils.dart';
import 'edit_test_screen.dart';
import 'test_screen.dart';

class DetailsTestScreen extends TestScreen {
  final _detailsScreenFinder = find.byValueKey('__todoDetailsScreen__');
  final _deleteButtonFinder = find.byValueKey('__deleteTodoFab__');
  final _checkboxFinder = find.byValueKey('DetailsTodo__Checkbox');
  final _taskFinder = find.byValueKey('DetailsTodo__Task');
  final _noteFinder = find.byValueKey('DetailsTodo__Note');
  final _editTodoFabFinder = find.byValueKey('__editTodoFab__');
  final _backButtonFinder = find.byTooltip('Back');

  DetailsTestScreen(FlutterDriver driver) : super(driver);

  @override
  Future<bool> isReady({Duration timeout}) =>
      widgetExists(driver, _detailsScreenFinder);

  Future<String> get task async => await driver.getText(_taskFinder);

  Future<String> get note async => await driver.getText(_noteFinder);

  Future<DetailsTestScreen> tapCheckbox() async {
    await driver.tap(_checkboxFinder);

    return this;
  }

  EditTestScreen tapEditTodoButton() {
    driver.tap(_editTodoFabFinder);

    return new EditTestScreen(driver);
  }

  Future<Null> tapDeleteButton() async {
    await driver.tap(_deleteButtonFinder);
  }

  Future<Null> tapBackButton() async {
    await driver.tap(_backButtonFinder);

    return this;
  }
}
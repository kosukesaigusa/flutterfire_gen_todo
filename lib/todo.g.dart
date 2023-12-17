// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$todoQueryHash() => r'1ae9990e8428b0fd8b6e46f9f84089d61a9b9926';

/// See also [todoQuery].
@ProviderFor(todoQuery)
final todoQueryProvider = AutoDisposeProvider<TodoQuery>.internal(
  todoQuery,
  name: r'todoQueryProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$todoQueryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TodoQueryRef = AutoDisposeProviderRef<TodoQuery>;
String _$todoListHash() => r'bce4677ae7e582f05bd509821923246f681cf0e3';

/// See also [TodoList].
@ProviderFor(TodoList)
final todoListProvider =
    AutoDisposeAsyncNotifierProvider<TodoList, List<Todo>>.internal(
  TodoList.new,
  name: r'todoListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$todoListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TodoList = AutoDisposeAsyncNotifier<List<Todo>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo.dart';

// **************************************************************************
// Generator: FlutterFireGen
// **************************************************************************

class ReadTodo {
  const ReadTodo({
    required this.title,
    required this.isCompleted,
    required this.createdAt,
    required this.updatedAt,
    required this.todoId,
    required this.path,
    required this.todoReference,
  });

  final String title;

  final bool isCompleted;

  final DateTime? createdAt;

  final DateTime? updatedAt;

  final String todoId;

  final String path;

  final DocumentReference<ReadTodo> todoReference;

  factory ReadTodo.fromJson(Map<String, dynamic> json) {
    final extendedJson = <String, dynamic>{
      ...json,
    };
    return ReadTodo(
      title: extendedJson['title'] as String,
      isCompleted: extendedJson['isCompleted'] as bool? ?? false,
      createdAt: (extendedJson['createdAt'] as Timestamp?)?.toDate(),
      updatedAt: (extendedJson['updatedAt'] as Timestamp?)?.toDate(),
      todoId: extendedJson['todoId'] as String,
      path: extendedJson['path'] as String,
      todoReference:
          extendedJson['todoReference'] as DocumentReference<ReadTodo>,
    );
  }

  factory ReadTodo.fromDocumentSnapshot(DocumentSnapshot ds) {
    final data = ds.data()! as Map<String, dynamic>;
    return ReadTodo.fromJson(<String, dynamic>{
      ...data,
      'todoId': ds.id,
      'path': ds.reference.path,
      'todoReference': ds.reference.parent.doc(ds.id).withConverter(
            fromFirestore: (ds, _) => ReadTodo.fromDocumentSnapshot(ds),
            toFirestore: (obj, _) => throw UnimplementedError(),
          ),
    });
  }

  ReadTodo copyWith({
    String? title,
    bool? isCompleted,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? todoId,
    String? path,
    DocumentReference<ReadTodo>? todoReference,
  }) {
    return ReadTodo(
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      todoId: todoId ?? this.todoId,
      path: path ?? this.path,
      todoReference: todoReference ?? this.todoReference,
    );
  }
}

class CreateTodo {
  const CreateTodo({
    required this.title,
    this.isCompleted,
  });

  final String title;
  final bool? isCompleted;

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{
      'title': title,
      'isCompleted': isCompleted ?? false,
      'createdAt': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
    };
    final jsonPostProcessors = <({String key, dynamic value})>[];
    return {
      ...json,
      ...Map.fromEntries(jsonPostProcessors
          .map((record) => MapEntry(record.key, record.value))),
    };
  }
}

class UpdateTodo {
  const UpdateTodo({
    this.title,
    this.isCompleted,
    this.createdAt,
  });

  final String? title;
  final bool? isCompleted;
  final DateTime? createdAt;

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{
      if (title != null) 'title': title,
      if (isCompleted != null) 'isCompleted': isCompleted,
      if (createdAt != null) 'createdAt': createdAt,
      'updatedAt': FieldValue.serverTimestamp(),
    };
    final jsonPostProcessors = <({String key, dynamic value})>[];
    return {
      ...json,
      ...Map.fromEntries(jsonPostProcessors
          .map((record) => MapEntry(record.key, record.value))),
    };
  }
}

class DeleteTodo {}

/// Provides a reference to the todos collection for reading.
final readTodoCollectionReference =
    FirebaseFirestore.instance.collection('todos').withConverter<ReadTodo>(
          fromFirestore: (ds, _) => ReadTodo.fromDocumentSnapshot(ds),
          toFirestore: (_, __) => throw UnimplementedError(),
        );

/// Provides a reference to a todo document for reading.
DocumentReference<ReadTodo> readTodoDocumentReference({
  required String todoId,
}) =>
    readTodoCollectionReference.doc(todoId);

/// Provides a reference to the todos collection for creating.
final createTodoCollectionReference =
    FirebaseFirestore.instance.collection('todos').withConverter<CreateTodo>(
          fromFirestore: (_, __) => throw UnimplementedError(),
          toFirestore: (obj, _) => obj.toJson(),
        );

/// Provides a reference to a todo document for creating.
DocumentReference<CreateTodo> createTodoDocumentReference({
  required String todoId,
}) =>
    createTodoCollectionReference.doc(todoId);

/// Provides a reference to the todos collection for updating.
final updateTodoCollectionReference =
    FirebaseFirestore.instance.collection('todos').withConverter<UpdateTodo>(
          fromFirestore: (_, __) => throw UnimplementedError(),
          toFirestore: (obj, _) => obj.toJson(),
        );

/// Provides a reference to a todo document for updating.
DocumentReference<UpdateTodo> updateTodoDocumentReference({
  required String todoId,
}) =>
    updateTodoCollectionReference.doc(todoId);

/// Provides a reference to the todos collection for deleting.
final deleteTodoCollectionReference =
    FirebaseFirestore.instance.collection('todos').withConverter<DeleteTodo>(
          fromFirestore: (_, __) => throw UnimplementedError(),
          toFirestore: (_, __) => throw UnimplementedError(),
        );

/// Provides a reference to a todo document for deleting.
DocumentReference<DeleteTodo> deleteTodoDocumentReference({
  required String todoId,
}) =>
    deleteTodoCollectionReference.doc(todoId);

/// Manages queries against the todos collection.
class TodoQuery {
  /// Fetches [ReadTodo] documents.
  Future<List<ReadTodo>> fetchDocuments({
    GetOptions? options,
    Query<ReadTodo>? Function(Query<ReadTodo> query)? queryBuilder,
    int Function(ReadTodo lhs, ReadTodo rhs)? compare,
  }) async {
    Query<ReadTodo> query = readTodoCollectionReference;
    if (queryBuilder != null) {
      query = queryBuilder(query)!;
    }
    final qs = await query.get(options);
    final result = qs.docs.map((qds) => qds.data()).toList();
    if (compare != null) {
      result.sort(compare);
    }
    return result;
  }

  /// Subscribes [Todo] documents.
  Stream<List<ReadTodo>> subscribeDocuments({
    Query<ReadTodo>? Function(Query<ReadTodo> query)? queryBuilder,
    int Function(ReadTodo lhs, ReadTodo rhs)? compare,
    bool includeMetadataChanges = false,
    bool excludePendingWrites = false,
  }) {
    Query<ReadTodo> query = readTodoCollectionReference;
    if (queryBuilder != null) {
      query = queryBuilder(query)!;
    }
    var streamQs =
        query.snapshots(includeMetadataChanges: includeMetadataChanges);
    if (excludePendingWrites) {
      streamQs = streamQs.where((qs) => !qs.metadata.hasPendingWrites);
    }
    return streamQs.map((qs) {
      final result = qs.docs.map((qds) => qds.data()).toList();
      if (compare != null) {
        result.sort(compare);
      }
      return result;
    });
  }

  /// Fetches a specific [ReadTodo] document.
  Future<ReadTodo?> fetchDocument({
    required String todoId,
    GetOptions? options,
  }) async {
    final ds = await readTodoDocumentReference(
      todoId: todoId,
    ).get(options);
    return ds.data();
  }

  /// Subscribes a specific [Todo] document.
  Stream<ReadTodo?> subscribeDocument({
    required String todoId,
    bool includeMetadataChanges = false,
    bool excludePendingWrites = false,
  }) {
    var streamDs = readTodoDocumentReference(
      todoId: todoId,
    ).snapshots(includeMetadataChanges: includeMetadataChanges);
    if (excludePendingWrites) {
      streamDs = streamDs.where((ds) => !ds.metadata.hasPendingWrites);
    }
    return streamDs.map((ds) => ds.data());
  }

  /// Adds a [Todo] document.
  Future<DocumentReference<CreateTodo>> add({
    required CreateTodo createTodo,
  }) =>
      createTodoCollectionReference.add(createTodo);

  /// Sets a [Todo] document.
  Future<void> set({
    required String todoId,
    required CreateTodo createTodo,
    SetOptions? options,
  }) =>
      createTodoDocumentReference(
        todoId: todoId,
      ).set(createTodo, options);

  /// Updates a specific [Todo] document.
  Future<void> update({
    required String todoId,
    required UpdateTodo updateTodo,
  }) =>
      updateTodoDocumentReference(
        todoId: todoId,
      ).update(updateTodo.toJson());

  /// Deletes a specific [Todo] document.
  Future<void> delete({
    required String todoId,
  }) =>
      deleteTodoDocumentReference(
        todoId: todoId,
      ).delete();
}

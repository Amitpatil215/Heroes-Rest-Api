import 'package:heroes/heroes.dart';

// Hero is instance type of entity
//* ManagedObject<T>
// T stands for Table
// used for auto transferring objects to the database and back
class Hero extends ManagedObject<_Hero> implements _Hero {}

/// it is direct mapping of Hero class in database table
// Table
class _Hero {
// Column of Table
  @primaryKey
  int id;
  @Column(unique: true)
  String name;
}

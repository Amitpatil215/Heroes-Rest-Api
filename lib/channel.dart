import './controller/heroes_controller.dart';
import 'heroes.dart';

class HeroesChannel extends ApplicationChannel {
  ManagedContext context;

  @override
  Future prepare() async {
    logger.onRecord.listen(
        (rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));

    // ManagedDataModel.fromCurrentMirrorSystem()will find all of our ManagedObjects<T>
    // subclasses nd compile them into data model.

    final dataModel = ManagedDataModel.fromCurrentMirrorSystem();

    // PostgreSQLPersistentStore takes database connection info
    // it will use to connect and nd send queries to db.

    final persistentStore = PostgreSQLPersistentStore.fromConnectionInfo(
        "heroes_user", "password", "localhost", 5432, "heroes");

    //both above objects packed in  ManagedContext
    context = ManagedContext(dataModel, persistentStore);
  }

  @override
  Controller get entryPoint {
    final router = Router();

    //* linking HeroresController to the router
    //  declare the :id portion of our route to be optional by wrapping it in square brackets.
    router.route('/heroes/[:id]').link(() => HeroesController(context));

    // Prefer to use `link` instead of `linkFunction`.
    // See: https://aqueduct.io/docs/http/request_controller/
    router.route("/example").linkFunction((request) async {
      return Response.ok({"key": "value"});
    });

    return router;
  }
}

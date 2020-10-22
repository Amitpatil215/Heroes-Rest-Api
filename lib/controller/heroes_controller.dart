import 'package:aqueduct/aqueduct.dart';
import 'package:heroes/heroes.dart';
import '../model/hero.dart';

//class HeroesController extends Controller {
class HeroesController extends ResourceController {
  HeroesController(this.context);

  final ManagedContext context;

  //context is a service object it get passed from prepare()
  // so that each method in this class can execute database queries.

  // final _heroes = [
  //   {'id': 10, 'name': 'Amit'},
  //   {'id': 11, 'name': 'Mr. Nice'},
  //   {'id': 12, 'name': 'Narco'},
  //   {'id': 13, 'name': 'Bombasto'},
  //   {'id': 14, 'name': 'Celeritas'},
  //   {'id': 15, 'name': 'Magneta'},
  // ];

  //! We want to create distinct method for each operations
  // ! but we have only one handle method

  // @override
  // Future<RequestOrResponse> handle(Request request) async {
  //   print("handle running");
  //   if (request.path.variables.containsKey('id')) {
  //     final id = int.parse(request.path.variables['id']);
  //     final hero = _heroes.firstWhere(
  //       (eachMap) => eachMap['id'] == id,
  //       orElse: () => null,
  //     );
  //     if (hero == null) {
  //       return Response.notFound();
  //     }
  //     return Response.ok(hero);
  //   }
  //   return Response.ok(_heroes);
  // }

  //? Using Resource Controller for creating distinct method
  // ? For each Operations.

  @Operation.get()
  Future<Response> getAllHeroes() async {
    print("getAllHeroes running");
    final heroQuery = Query<Hero>(context);
    final heroes = await heroQuery.fetch();
    return Response.ok(heroes);
  }

  @Operation.get('id')
  Future<Response> getHeroByID(@Bind.path('id') int heroId) async {
    print("getHeroByID running");

    final heroQuery = Query<Hero>(context)..where((x) => x.id).equalTo(heroId);

    //! what if we fail to parse the id
    //! it throws 500 error code, without any error message
    // ! so using @bind.path() to generate better error code

    //final id = int.parse(request.path.variables['id']);

    final hero = await heroQuery.fetchOne();

    if (hero == null) {
      return Response.notFound();
    }

    return Response.ok(hero);
  }
}

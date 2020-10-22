import 'package:aqueduct/aqueduct.dart';
import 'package:heroes/heroes.dart';

//class HeroesController extends Controller {
class HeroesController extends ResourceController {
  final _heroes = [
    {'id': 10, 'name': 'Amit'},
    {'id': 11, 'name': 'Mr. Nice'},
    {'id': 12, 'name': 'Narco'},
    {'id': 13, 'name': 'Bombasto'},
    {'id': 14, 'name': 'Celeritas'},
    {'id': 15, 'name': 'Magneta'},
  ];

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
    return Response.ok(_heroes);
  }

  @Operation.get('id')
  Future<Response> getHeroByID(@Bind.path('id') int heroId) async {
    print("getHeroByID running");

    //! what if we fail to parse the id
    //! it throws 500 error code, without any error message
    // ! so using @bind.path() to generate better error code

    //final id = int.parse(request.path.variables['id']);
    final hero =
        _heroes.firstWhere((hero) => hero['id'] == heroId, orElse: () => null);
    if (hero == null) {
      return Response.notFound();
    }

    return Response.ok(hero);
  }
}

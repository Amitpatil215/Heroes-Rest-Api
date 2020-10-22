import 'package:aqueduct/aqueduct.dart';
import 'package:heroes/heroes.dart';

class HeroesController extends Controller {
  final _heroes = [
    {'id': 10, 'name': 'Amit'},
    {'id': 11, 'name': 'Mr. Nice'},
    {'id': 12, 'name': 'Narco'},
    {'id': 13, 'name': 'Bombasto'},
    {'id': 14, 'name': 'Celeritas'},
    {'id': 15, 'name': 'Magneta'},
  ];

  @override
  Future<RequestOrResponse> handle(Request request) async {
    if (request.path.variables.containsKey('id')) {
      final id = int.parse(request.path.variables['id']);
      final hero = _heroes.firstWhere(
        (eachMap) => eachMap['id'] == id,
        orElse: () => null,
      );
      if (hero == null) {
        return Response.notFound();
      }
      return Response.ok(hero);
    }
    return Response.ok(_heroes);
  }
}

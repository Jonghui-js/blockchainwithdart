import 'controller/controller_help.dart';
import 'dart_blockchain.dart';

class DartBlockchainChannel extends ApplicationChannel {
  @override
  Future prepare() async {
    logger.onRecord.listen(
        (rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));
  }

  @override
  Controller get entryPoint {
    final router = Router();

    router.route("/blockchain").link(() => BlockChainController());
    router.route("/transaction").link(() => TransactionController());
    router.route("/mine").link(() => MineController());

    router.route('/client').linkFunction((request) async {
      final client = await File('client.html').readAsString();
      return Response.ok(client)..contentType = ContentType.html;
    });

    return router;
  }
}

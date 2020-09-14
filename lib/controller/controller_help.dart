import 'package:aqueduct/aqueduct.dart';
import 'package:dart_blockchain/blockchain.dart';
import 'package:dart_blockchain/dart_blockchain.dart';
import 'package:dart_blockchain/models/Block.dart';
import 'package:dart_blockchain/models/Transaction.dart';

class BlockChainController extends ResourceController {
  @Operation.get()
  Future<Response> getAllBlocks() async {
    final chainList = BlockChain().chain;
    final postsList = [];
    for (Block i in chainList) {
      postsList.add(i.toJson());
    }
    return Response.ok(postsList);
  }

  @Operation.post()
  Future<Response> createNewRead() async {
    return Response.ok('create new read');
  }

  @Operation.put()
  Future<Response> updateRead() async {
    return Response.ok('update new read');
  }

  @Operation.delete()
  Future<Response> deleteRead() async {
    return Response.ok('delete new read');
  }
}

class TransactionController extends ResourceController {
  @Operation.get()
  Future<Response> getAll() async {
    return Response.ok('Got all Reads');
  }

  /*  @Operation.post()
  Future<Response> createTransaction() async {
    final Map<String, dynamic> body = await request.body.decode();
    
    int data =
        BlockChain().createNewTransaction(body.amount, sender, recipient);
    return Response.ok('create new read');
  } */

  @Operation.put()
  Future<Response> updateRead() async {
    return Response.ok('update new read');
  }

  @Operation.delete()
  Future<Response> deleteRead() async {
    return Response.ok('delete new read');
  }
}

class MineController extends ResourceController {
  @Operation.get()
  Future<Response> getAll() async {
    return Response.ok('Got all Reads');
  }

  @Operation.post()
  Future<Response> createNewRead() async {
    return Response.ok('create new read');
  }

  @Operation.put()
  Future<Response> updateRead() async {
    return Response.ok('update new read');
  }

  @Operation.delete()
  Future<Response> deleteRead() async {
    return Response.ok('delete new read');
  }
}

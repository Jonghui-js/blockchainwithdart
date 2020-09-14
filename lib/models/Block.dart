import 'package:dart_blockchain/models/Transaction.dart';

class Block {
  Block(
      {this.index,
      this.timeStamp,
      this.transactions,
      this.nonce,
      this.hash,
      this.previousBlockHash});

  Map<String, dynamic> toJson() => {
        'index': index,
        'timeStamp': timeStamp.toIso8601String(),
        'transactions': transactions,
        'nonce': nonce,
        'hash': hash,
        'previousBlockHash': previousBlockHash,
      };

  int index;
  DateTime timeStamp;
  List<Transaction> transactions;
  int nonce;
  String hash;
  String previousBlockHash;
}

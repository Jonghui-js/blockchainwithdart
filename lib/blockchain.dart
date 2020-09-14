import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'models/Block.dart';
import 'models/Transaction.dart';

class BlockChain {
  List<Block> chain = [];
  List<Transaction> pendingTransactions = [];
  final Block genesisBlock =
      Block(nonce: 100, previousBlockHash: '0', hash: '0');

  Block createNewBlock(int nonce, String previousBlockHash, String hash) {
    final newBlock = Block(
      index: chain.length + 1,
      timeStamp: DateTime.now(),
      transactions: pendingTransactions,
      nonce: nonce,
      hash: hash,
      previousBlockHash: previousBlockHash,
    );
    pendingTransactions = [];
    chain.add(newBlock);

    return newBlock;
  }

  Block getLastBlock() {
    return chain[chain.length - 1];
  }

  int createNewTransaction(int amount, String sender, String recipient) {
    final newTransaction = Transaction(
      amount: amount,
      sender: sender,
      recipient: recipient,
    );
    pendingTransactions.add(newTransaction);
    return getLastBlock().index + 1;
  }

  Digest hashBlock(
      String previousBlockHash, List<Map> currentBlockData, int nonce) {
    ////retrun 'dsfsdsdfsdfsdf234sdksdjflskfj29392'
    final dataAsString =
        previousBlockHash + nonce.toString() + jsonEncode(currentBlockData);
    final bytes = utf8.encode(dataAsString);
    final sdf = sha256.convert(bytes);

    return sdf;
  }

  int proofOfWork(String previousBlockHash, List<Map> currentBlockData) {
    var nonce = 0;
    var hash = hashBlock(previousBlockHash, currentBlockData, nonce);
    while (hash.toString().substring(0, 4) != '0000') {
      nonce++;
      hash = hashBlock(previousBlockHash, currentBlockData, nonce);
    }
    return nonce;
  }
}

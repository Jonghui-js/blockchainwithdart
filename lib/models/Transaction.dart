class Transaction {
  Transaction({this.amount, this.sender, this.recipient});
  Map<String, dynamic> toJson() => {
        'amount': amount,
        'sender': sender,
        'recipient': recipient,
      };

  int amount;
  String sender;
  String recipient;
}

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class TadashiService {
  Future<void> checkout({
    required num totalAmount,
    required Function(Map<String, dynamic>) onComplete,
    required Function(bool) loderOnOFF,
  }) async {
    try {
      loderOnOFF(true);
      final String transactionId = DateTime.now().millisecondsSinceEpoch.toString();
      await Future.delayed(const Duration(milliseconds: 500));
      onComplete.call({
        'transaction_id': transactionId,
      });
      loderOnOFF(false);
    } catch (e) {
      loderOnOFF(false);
      toast(e.toString());
      rethrow;
    }
  }
}
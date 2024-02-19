import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

String? generateRandomGratitude(List<GratitudeBankRecord> gratitudeBank) {
  if (gratitudeBank.isNotEmpty) {
    final randomIndex = math.Random().nextInt(gratitudeBank.length);
    return gratitudeBank[randomIndex].question;
  } else {
    return "No Questions Available";
  }
}

String? generateRandomMindfulness(List<MindfulnessBankRecord> gratitudeBank) {
  if (gratitudeBank.isNotEmpty) {
    final randomIndex = math.Random().nextInt(gratitudeBank.length);
    return gratitudeBank[randomIndex].question;
  } else {
    return "No Questions Available";
  }
}

String? generateRandomEmpathy(List<EmpathyBankRecord> empathyBank) {
  if (empathyBank.isNotEmpty) {
    final randomIndex = math.Random().nextInt(empathyBank.length);
    return empathyBank[randomIndex].question;
  } else {
    return empathyBank.length.toString();
  }
}

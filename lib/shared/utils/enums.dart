import 'package:flutter/cupertino.dart';

enum AccountType { employee, osgb, marketer, tester, company }

enum TestStatus { pending, reported, approved, rejected }

enum Gender { male, female, other }

enum PaymentType { credit, cash, bill }

enum PriceReportType { patient, company }

enum PriceViewType { dailty, monthly }

enum Collections {
  osgb,
  users,
  companies,
  stocks,
  tests,
  companyTests,
  testStock,
  secretTokens,
  userTests,
  meetings
}

enum Modules {
  patientActions,
  testActions,
  settings,
  actionTracking,
  marketingTracking
}

enum LogAction {
  testCreate,
  testEdit,
  testRemove,
  patientCreate,
  patientUpdate,
  patientTestCreate,
  patientTestApprove,
  patientTestRemove,
  patientTestReport,
  companyTestCreate,
  companyTestRemove,
  companyCreation,
  companyAdminCreation,
  marketerCreation,
  meetingCreation,
  meetingUpdating,
}

enum ActionType { osgb, company, marketer, patient, unknown }

enum MessageType { success, error, processsing }

enum SnackbarOption { processing, success, error }

enum Meetings { pending, met, meetAgain }

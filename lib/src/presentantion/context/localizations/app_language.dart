import '../export_context.dart';

class AppLanguage {
  static AppLanguage instance = AppLanguage._internal();

  factory AppLanguage() {
    return instance;
  }
  UserPreferences _pref = UserPreferences();

  AppLanguage._internal();

  static const Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'locale': 'en',
      'languageSpanish': 'Spanish',
      'languageEnglish': 'English',
      'login': 'Login',
      'email': 'Email',
      'password': 'Password',
      'forgetPassword': 'Forgotten your password?',
      'loginBotton': 'Log in',
      'selectLanguage': 'Choose a language',
      'dashBoardTitlePag1': 'Welcome to App Sittca',
      'inven': 'Stock',
      'code': 'Code',
      'january': 'January',
      'february': 'February',
      'march': 'March',
      'april': 'April',
      'may': 'May',
      'june': 'June',
      'july': 'July',
      'september': 'September',
      'august': 'August',
      'october': 'October',
      'november': 'November',
      'december': 'December',
    },
    'es': {
      'locale': 'es',
      'languageSpanish': 'Español',
      'languageEnglish': 'Ingles',
      'login': 'Inicio de sesión',
      'email': 'Correo electrónico',
      'password': 'Contraseña',
      'forgetPassword': '¿Haz olvidado tu contraseña?',
      'loginBotton': 'Iniciar Sesión',
      'selectLanguage': 'Elije un lenguaje',
      'askTag': 'Solicitar Tag',
      'erroImage': 'Ups, error al cargar imagen!',
      'withoutInformation': 'Sin información',
      'code': 'Codigo',
      'january': 'Enero',
      'february': 'Febrero',
      'march': 'Marzo',
      'april': 'Abril',
      'may': 'Mayo',
      'june': 'Junio',
      'july': 'Julio',
      'september': 'Septiembre',
      'august': 'Agosto',
      'october': 'Octubre',
      'november': 'Noviembre',
      'december': 'Diciembre'
    },
  };

  String getText(String key) {
    String _languaje =
        _pref.getString('locale').isNotEmpty ? _pref.getString('locale') : 'es';
    var text = _localizedValues.containsKey(_languaje)
        ? _localizedValues[_languaje]![key]
        : _localizedValues['es']![key];

    return text ?? 'Default';
  }

  String get locale {
    return getText('locale');
  }

  String get owner {
    return getText('owner');
  }

  String get assignQrCode {
    return getText('assignQrCode');
  }

  String get addPhotographicEvidence {
    return getText('addPhotographicEvidence');
  }

  String get verifyCard {
    return getText('verifyCard');
  }

  String get family {
    return getText('family');
  }

  String get languageSpanish {
    return getText('languageSpanish');
  }

  String get activitySave {
    return getText('activitySave');
  }

  String get activitySaveOk {
    return getText('activitySaveOk');
  }

  String get notActivitySave {
    return getText('notActivitySave');
  }

  String get activityEdit {
    return getText('activityEdit');
  }

  String get activityEditOk {
    return getText('activityEditOk');
  }

  String get notActivityEdit {
    return getText('notActivityEdit');
  }

  String get languageEnglish {
    return getText('languageEnglish');
  }

  String get login {
    return getText('login');
  }

  String get email {
    return getText('email');
  }

  String get password {
    return getText('password');
  }

  String get forgetPassword {
    return getText('forgetPassword');
  }

  String get loginBotton {
    return getText('loginBotton');
  }

  String get selectLanguage {
    return getText('selectLanguage');
  }

  String get dashBoardTitlePag1 {
    return getText('dashBoardTitlePag1');
  }

  String get dashBoardTitlePag2Admin {
    return getText('dashBoardTitlePag2Admin');
  }

  String get dashBoardTitlePag2Operator {
    return getText('dashBoardTitlePag2Operator');
  }

  String get dashBoardTitlePag2Certifier {
    return getText('dashBoardTitlePag2Certifier');
  }

  String get dashBoardTitlePag2Client {
    return getText('dashBoardTitlePag2Client');
  }

  String get dashBoardTitlePag3 {
    return getText('dashBoardTitlePag3');
  }

  String get dashBoardTextPag1 {
    return getText('dashBoardTextPag1');
  }

  String get typingEquipment {
    return getText('typingEquipment');
  }

  String get withoutDescription {
    return getText('withoutDescription');
  }

  String get dashBoardTextPag2Admin {
    return getText('dashBoardTextPag2Admin');
  }

  String get dashBoardTextPag2Operator {
    return getText('dashBoardTextPag2Operator');
  }

  String get writeSearch {
    return getText('writeSearch');
  }

  String get dashBoardTextPag2Certifier {
    return getText('dashBoardTextPag2Certifier');
  }

  String get dashBoardTextPag2Client {
    return getText('dashBoardTextPag2Client');
  }

  String get dashBoardTextPag3 {
    return getText('dashBoardTextPag3');
  }

  String get contineAdd {
    return getText('contineAdd');
  }

  String get textQR {
    return getText('textQR');
  }
  

  String get dashBoardBotton {
    return getText('dashBoardBotton');
  }

  String get saveRequest {
    return getText('saveRequest');
  }

  String get filterBy {
    return getText('filterBy');
  }

  String get filter {
    return getText('filter');
  }

  String get createNewActivity {
    return getText('createNewActivity');
  }

  String get cancel {
    return getText('cancel');
  }

  String get readQR {
    return getText('readQR');
  }

  String get search {
    return getText('search');
  }

  String get hello {
    return getText('hello');
  }

  String get newActivityBotton {
    return getText('newActivityBotton');
  }

  String get viewDetails {
    return getText('viewDetails');
  }

  String get inven {
    return getText('inven');
  }

  String get inProgressActivities {
    return getText('inProgressActivities');
  }

  String get serviceInformation {
    return getText('serviceInformation');
  }

  String get completedActivities {
    return getText('completedActivities');
  }

  String get saveWork {
    return getText('saveWork');
  }

  String get starDateActivity {
    return getText('starDateActivity');
  }

  String get endDateActivity {
    return getText('endDateActivity');
  }

  String get proyectNum {
    return getText('proyectNum');
  }

  String get drafted {
    return getText('drafted');
  }

  String get position {
    return getText('position');
  }

  String get approved {
    return getText('approved');
  }

  String get pending {
    return getText('pending');
  }

  String get selectElement {
    return getText('selectElement');
  }

  String get cubicMeters {
    return getText('cubicMeters');
  }

  String get activitiesFound {
    return getText('activitiesFound');
  }

  String get year {
    return getText('year');
  }

  String get applicationDate {
    return getText('applicationDate');
  }

  String get activityCode {
    return getText('activityCode');
  }

  String get typingLocalization {
    return getText('typingLocalization');
  }

  String get withoutIdentification {
    return getText('withoutIdentification');
  }

  String get finished {
    return getText('finished');
  }

  String get yes {
    return getText('yes');
  }

  String get no {
    return getText('no');
  }

  String get disapproved {
    return getText('disapproved');
  }

  String get cellar {
    return getText('cellar');
  }

  String get assignOperator {
    return getText('assignOperator');
  }

  String get newRequest {
    return getText('newRequest');
  }

  String get starDate {
    return getText('starDate');
  }

  String get completed {
    return getText('completed');
  }

  String get failSesion {
    return getText('failSesion');
  }

  String get withoutState {
    return getText('withoutState');
  }

  String get correctEmail {
    return getText('correctEmail');
  }

  String get currentInventory {
    return getText('currentInventory');
  }

  String get cubicMetersPerUnit {
    return getText('cubicMetersPerUnit');
  }

  String get units {
    return getText('units');
  }

  String get totalActivities {
    return getText('totalActivities');
  }

  String get scaffoldParts {
    return getText('scaffoldParts');
  }

  String get positionCautch {
    return getText('positionCautch');
  }

  String get askTag {
    return getText('askTag');
  }

  String get greenCard {
    return getText('greenCard');
  }

  String get redCard {
    return getText('redCard');
  }

  String get yellowCard {
    return getText('yellowCard');
  }

  String get withoutCard {
    return getText('withoutCard');
  }

  String get proyect {
    return getText('proyect');
  }

  String get state {
    return getText('state');
  }

  String get code {
    return getText('code');
  }

  String get january {
    return getText('january');
  }

  String get february {
    return getText('february');
  }

  String get march {
    return getText('march');
  }

  String get april {
    return getText('april');
  }

  String get may {
    return getText('may');
  }

  String get june {
    return getText('june');
  }

  String get july {
    return getText('july');
  }

  String get august {
    return getText('august');
  }

  String get october {
    return getText('october');
  }

  String get september {
    return getText('september');
  }

  String get november {
    return getText('november');
  }

  String get december {
    return getText('december');
  }

  String get equipment {
    return getText('equipment');
  }

  String get leader {
    return getText('leader');
  }

  String get myActivities {
    return getText('myActivities');
  }

  String get reports {
    return getText('reports');
  }

  String get yesGuie {
    return getText('yesGuie');
  }

  String get noGuie {
    return getText('noGuie');
  }

  String get naGuie {
    return getText('naGuie');
  }

  String get dateOfDisarmament {
    return getText('dateOfDisarmament');
  }

  String get activity {
    return getText('activity');
  }

  String get specialty {
    return getText('specialty');
  }

  String get areaLocation {
    return getText('areaLocation');
  }

  String get responsible {
    return getText('responsible');
  }

  String get technicalSheets {
    return getText('technicalSheets');
  }

  String get certify {
    return getText('certify');
  }

  String get reCertify {
    return getText('reCertify');
  }

  String get inspect {
    return getText('inspect');
  }

  String get createNewTask {
    return getText('createNewTask');
  }

  String get activityToApproved {
    return getText('activityToApproved');
  }

  String get queries {
    return getText('queries');
  }

  String get certifications {
    return getText('certifications');
  }

  String get reCertifications {
    return getText('reCertifications');
  }

  String get locator {
    return getText('locator');
  }

  String get dataSheet {
    return getText('dataSheet');
  }

  String get logOut {
    return getText('logOut');
  }

  String get activityReport {
    return getText('activityReport');
  }

  String get erroImage {
    return getText('erroImage');
  }

  String get withoutInformation {
    return getText('withoutInformation');
  }

  String get seeReportCompleted {
    return getText('seeReportCompleted');
  }

  String get menu {
    return getText('menu');
  }

  String get finalize {
    return getText('finalize');
  }

  String get searhType {
    return getText('searhType');
  }

  String get material {
    return getText('material');
  }

  String get mounted {
    return getText('mounted');
  }

  String get unmounted {
    return getText('unmounted');
  }

  String get extensionn {
    return getText('extension');
  }

  String get modification {
    return getText('modification');
  }

  String get withoutService {
    return getText('withoutService');
  }

  String get date {
    return getText('date');
  }

  String get service {
    return getText('service');
  }

  String get withouthLeader {
    return getText('withouthLeader');
  }

  String get withoutequipment {
    return getText('withoutequipment');
  }

  String get inspectGuie {
    return getText('inspectGuie');
  }

  String get withoutProyect {
    return getText('withoutProyect');
  }

  String get hours {
    return getText('hours');
  }

  String get days {
    return getText('days');
  }

  String get structural {
    return getText('structural');
  }

  String get movable {
    return getText('movable');
  }

  String get cantilever {
    return getText('cantilever');
  }

  String get cantilever2 {
    return getText('cantilever2');
  }

  String get requiredShield {
    return getText('requiredShield');
  }

  String get generateform {
    return getText('generateForm');
  }

  String get hanging {
    return getText('hanging');
  }

  String get withouthStructure {
    return getText('withouthStructure');
  }

  String get returnn {
    return getText('return');
  }

  String get internal {
    return getText('internal');
  }

  String get externall {
    return getText('externall');
  }

  String get morning {
    return getText('morning');
  }

  String get afternoon {
    return getText('afternoon');
  }

  String get night {
    return getText('night');
  }

  String get withoutTurn {
    return getText('withoutTurn');
  }

  String get details {
    return getText('details');
  }

  String get dailyScaffoldInspection {
    return getText('dailyScaffoldInspection');
  }

  String get generalInformation {
    return getText('generalInformation');
  }

  String get proyectName {
    return getText('proyectName');
  }

  String get requestingCompany {
    return getText('requestingCompany');
  }

  String get applicantName {
    return getText('applicantName');
  }

  String get applicantCharge {
    return getText('applicantCharge');
  }

  String get scaffoldInformation {
    return getText('scaffoldInformation');
  }

  String get waitingForApproval {
    return getText('waitingForApproval');
  }

  String get unit {
    return getText('unit');
  }

  String get activitiesToCertify {
    return getText('activitiesToCertify');
  }

  String get activitiesToRecertify {
    return getText('activitiesToRecertify');
  }

  String get site {
    return getText('site');
  }

  String get localization {
    return getText('localization');
  }

  String get photographicRecord {
    return getText('photographicRecord');
  }

  String get armedScaffoldInformation {
    return getText('armedScaffoldInformation');
  }

  String get description {
    return getText('description');
  }

  String get noDescripcion {
    return getText('noDescripcion');
  }

  String get typeStructure {
    return getText('typeStructure');
  }

  String get typeMounted {
    return getText('typeMounted');
  }

  String get turn {
    return getText('turn');
  }

  String get collectionItem {
    return getText('collectionItem');
  }

  String get subProyect {
    return getText('subProyect');
  }

  String get supervisor {
    return getText('supervisor');
  }

  String get numberOfScaffolding {
    return getText('numberOfScaffolding');
  }

  String get numberOfHelpers {
    return getText('numberOfHelpers');
  }

  String get armedPhotography {
    return getText('armedPhotography');
  }

  String get measures {
    return getText('measures');
  }

  String get base {
    return getText('base');
  }

  String get type {
    return getText('type');
  }

  String get length {
    return getText('length');
  }

  String get width {
    return getText('width');
  }

  String get tall {
    return getText('tall');
  }

  String get volume {
    return getText('volume');
  }

  String get materialList {
    return getText('materialList');
  }

  String get geolocation {
    return getText('geolocation');
  }

  String get gangLeader {
    return getText('gangLeader');
  }

  String get withoutName {
    return getText('withoutName');
  }

  String get ubication {
    return getText('ubication');
  }

  String get startTime {
    return getText('startTime');
  }

  String get timeElapsed {
    return getText('timeElapsed');
  }

  String get leaderScaffolder {
    return getText('leaderScaffolder');
  }

  String get edit {
    return getText('edit');
  }

  String get withoutUbication {
    return getText('withoutUbication');
  }

  String get photographicEvidence {
    return getText('photographicEvidence');
  }

  String get historyLast {
    return getText('historyLast');
  }

  String get viewHistory {
    return getText('viewHistory');
  }

  String get history {
    return getText('history');
  }

  String get assignedCard {
    return getText('assignedCard');
  }

  String get withoutSerialId {
    return getText('withoutSerialId');
  }

  String get reportType {
    return getText('reportType');
  }

  String get certificationStatus {
    return getText('certificationStatus');
  }

  String get byLocation {
    return getText('byLocation');
  }

  String get perUnit {
    return getText('perUnit');
  }

  String get hoursMan {
    return getText('hoursMan');
  }

  String get alertSelectReports {
    return getText('alertSelectReports');
  }

  String get homeScreen {
    return getText('homeScreen');
  }

  String get notificationScreen {
    return getText('notificationScreen');
  }

  String get helpScreen {
    return getText('helpScreen');
  }

  String get myAccount {
    return getText('myAccount');
  }

  String get certificate {
    return getText('certificate');
  }

  String get customerRequest {
    return getText('customerRequest');
  }

  String get recertified {
    return getText('recertified');
  }

  String get notCertified {
    return getText('notCertified');
  }

  String get approvedActivityStatus {
    return getText('approvedActivityStatus');
  }

  String get minutes {
    return getText('minutes');
  }

  String get withoutMessage {
    return getText('withoutMessage');
  }

  String get make {
    return getText('make');
  }

  String get personalDate {
    return getText('personalDate');
  }

  String get phoneNumb {
    return getText('phoneNumb');
  }

  String get companyRepresentative {
    return getText('companyRepresentative');
  }

  String get actualCharge {
    return getText('actualCharge');
  }

  String get comunications {
    return getText('comunications');
  }

  String get results {
    return getText('results');
  }

  String get manageNotificaciones {
    return getText('manageNotificaciones');
  }

  String get termsAndConditions {
    return getText('termsAndConditions');
  }

  String get saveInformation {
    return getText('saveInformation');
  }

  String get continuee {
    return getText('continuee');
  }

  String get programations {
    return getText('programations');
  }

  String get withoutRegister {
    return getText('withoutRegister');
  }

  String get numAActivities {
    return getText('numAActivities');
  }

  String get withoutDate {
    return getText('withoutDate');
  }

  String get noProyect {
    return getText('noProyect');
  }

  String get typeService {
    return getText('typeService');
  }

  String get complete {
    return getText('complete');
  }

  String get writeHere {
    return getText('writeHere');
  }

  String get takePhoto {
    return getText('takePhoto');
  }

  String get upPhoto {
    return getText('upPhoto');
  }

  String get saveActivity {
    return getText('saveActivity');
  }

  String get deleteExtension {
    return getText('deleteExtension');
  }

  String get addExtension {
    return getText('addExtension');
  }

  String get select {
    return getText('select');
  }

  String get searhFamily {
    return getText('searhFamily');
  }

  String get client {
    return getText('client');
  }

  String get dowloadReport {
    return getText('dowloadReport');
  }

  String get red {
    return getText('red');
  }

  String get green {
    return getText('green');
  }

  String get yellow {
    return getText('yellow');
  }

  String get cubicMetersPerSite {
    return getText('cubicMetersPerSite');
  }

  String get menHoursPerDay {
    return getText('menHoursPerDay');
  }

  String get menHoursPerMounted {
    return getText('menHoursPerMounted');
  }

  String get menHoursPerUnmounted {
    return getText('menHoursPerUnmounted');
  }

  String get answer1 {
    return getText('answer1');
  }

  String get answer2 {
    return getText('answer2');
  }

  String get answer3 {
    return getText('answer3');
  }

  String get answer4 {
    return getText('answer4');
  }

  String get answer5 {
    return getText('answer5');
  }

  String get answer6 {
    return getText('answer6');
  }

  String get answer7 {
    return getText('answer7');
  }

  String get answer8 {
    return getText('answer8');
  }

  String get answer9 {
    return getText('answer9');
  }

  String get answer10 {
    return getText('answer10');
  }

  String get answer11 {
    return getText('answer11');
  }

  String get answer12 {
    return getText('answer12');
  }

  String get answer13 {
    return getText('answer13');
  }

  String get answer14 {
    return getText('answer14');
  }

  String get answer15 {
    return getText('answer15');
  }

  String get observations {
    return getText('observations');
  }

  String get assign {
    return getText('assign');
  }

  String get save {
    return getText('save');
  }

  String get projectionIn7Days {
    return getText('projectionIn7Days');
  }

  String get pendingCertification {
    return getText('pendingCertification');
  }

  String get pendingReCertification {
    return getText('pendingReCertification');
  }
}

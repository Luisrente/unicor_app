import '../models/export_model.dart';


abstract class ControlRepositoryInterface {

Future<User> searchUser( String id );
Future<User> register( );

}
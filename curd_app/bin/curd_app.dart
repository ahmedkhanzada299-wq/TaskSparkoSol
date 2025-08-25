import 'dart:io';
// import 'package:curd_app/curd_app.dart';

import 'file_impl.dart';
import 'server_impl.dart';
import 'user_details_model.dart';

Future<void> main(List<String> arguments) async {
  if (arguments.isEmpty) {
    print("Usage: -f <options> OR -s <string>");
    return;
  }
  // File mode
  else if (arguments[0] == "-f") {
    if (arguments.length < 2) {
      print("Usage: -f -c (create) | -FI (find by ID)");
      return;
    }

    final fileService = UserFileService();

    // Create Mode
    if (arguments[1] == "-c") {
      try {
        stdout.write("Enter Name: ");
        final name = stdin.readLineSync()?.trim();
        if (name == null || name.isEmpty) throw Exception("Name is required!");

        stdout.write("Enter First Name: ");
        final fName = stdin.readLineSync()?.trim();
        if (fName == null || fName.isEmpty) {
          throw Exception("First name is required!");
        }

        stdout.write("Enter Last Name: ");
        final lName = stdin.readLineSync()?.trim();
        if (lName == null || lName.isEmpty) {
          throw Exception("Last name is required!");
        }

        stdout.write("Enter Birth Year: ");
        final birthYear = stdin.readLineSync()?.trim();
        if (birthYear == null ||
            birthYear.isEmpty ||
            int.tryParse(birthYear) == null) {
          throw Exception("Invalid birth year!");
        }

        stdout.write("Enter Age: ");
        final ageInput = stdin.readLineSync()?.trim();
        final age = int.tryParse(ageInput ?? "");
        if (age == null) throw Exception("Invalid age!");

        stdout.write("Enter Nationality: ");
        final nationality = stdin.readLineSync()?.trim();
        if (nationality == null || nationality.isEmpty) {
          throw Exception("Nationality is required!");
        }

        final user = UserDetails(
          name: name,
          data: UserData(
            id: DateTime.now().millisecondsSinceEpoch,
            fName: fName,
            lName: lName,
            birthYear: birthYear,
            age: age,
            nationality: nationality,
          ),
        );

        await fileService.create(user);
        print("User created successfully!");
      } catch (e) {
        print("Error: ${e.toString()}");
      }
      // Find by id Mode
    } else if (arguments[1] == "-fi") {
      try {
        stdout.write("Enter User ID: ");
        final idInput = stdin.readLineSync()?.trim();
        if (idInput == null || idInput.isEmpty) {
          throw Exception("User ID is required!");
        }

        final user = await fileService.findByID(idInput);

        if (user != null) {
          print("User found!");
          print("Name: ${user.name}");
          print("First Name: ${user.data?.fName}");
          print("Last Name: ${user.data?.lName}");
          print("Age: ${user.data?.age}");
          print("Birth Year: ${user.data?.birthYear}");
          print("Nationality: ${user.data?.nationality}");
        } else {
          print("No user found with ID: $idInput");
        }
      } catch (e) {
        print("Error: ${e.toString()}");
      }
      // Find All
    } else if (arguments[1] == "-fa") {
      try {
        final users = await fileService.findAll();
        if (users.isEmpty) {
          print("No users found.");
        } else {
          print("All Users:");
          for (var user in users) {
            print("---------------");
            print("ID: ${user.id}");
            print("Name: ${user.name}");
            print("First Name: ${user.data?.fName}");
            print("Last Name: ${user.data?.lName}");
            print("Birth Year: ${user.data?.birthYear}");
            print("Age: ${user.data?.age}");
            print("Nationality: ${user.data?.nationality}");
          }
        }
      } catch (e) {
        print("Error: ${e.toString()}");
      }
    }
    // Delete by id
    else if (arguments[1] == "-di") {
      try {
        stdout.write("Enter User ID to delete: ");
        final idInput = stdin.readLineSync()?.trim();
        if (idInput == null || idInput.isEmpty) {
          throw Exception("User ID is required!");
        }

        await fileService.delete(idInput);
        print("User with ID $idInput deleted successfully.");
      } catch (e) {
        print("Error: ${e.toString()}");
      }
    }
    // Delete all
    else if (arguments[1] == "-da") {
      try {
        stdout.write("Are you sure you want to delete all users? (yes/no): ");
        final confirmation = stdin.readLineSync()?.trim().toLowerCase();
        if (confirmation == 'yes' ||
            confirmation == 'y' ||
            confirmation == 'Y') {
          await fileService.deleteAll();
          print("All users deleted successfully.");
        } else {
          print("Operation cancelled.");
        }
      } catch (e) {
        print("Error: ${e.toString()}");
      }
    }
    // Update User
    else if (arguments[1] == "-u") {
      try {
        stdout.write("Enter User ID to update: ");
        final idInput = stdin.readLineSync()?.trim();
        if (idInput == null || idInput.isEmpty) {
          throw Exception("User ID is required!");
        }

        final existingUser = await fileService.findByID(idInput);
        if (existingUser == null) {
          print("No user found with ID: $idInput");
          return;
        }

        stdout.write(
          "Enter new Name (leave blank to keep '${existingUser.name}'): ",
        );
        final name = stdin.readLineSync()?.trim();
        final updatedName = (name != null && name.isNotEmpty)
            ? name
            : existingUser.name;

        stdout.write(
          "Enter new First Name (leave blank to keep '${existingUser.data?.fName}'): ",
        );
        final fName = stdin.readLineSync()?.trim();
        final updatedFName = (fName != null && fName.isNotEmpty)
            ? fName
            : existingUser.data?.fName ?? '';

        stdout.write(
          "Enter new Last Name (leave blank to keep '${existingUser.data?.lName}'): ",
        );
        final lName = stdin.readLineSync()?.trim();
        final updatedLName = (lName != null && lName.isNotEmpty)
            ? lName
            : existingUser.data?.lName ?? '';

        stdout.write(
          "Enter new Birth Year (leave blank to keep '${existingUser.data?.birthYear}'): ",
        );
        final birthYear = stdin.readLineSync()?.trim();
        final updatedBirthYear = (birthYear != null && birthYear.isNotEmpty)
            ? birthYear
            : existingUser.data?.birthYear ?? '';

        stdout.write(
          "Enter new Age (leave blank to keep '${existingUser.data?.age}'): ",
        );
        final ageInput = stdin.readLineSync()?.trim();
        final updatedAge = (ageInput != null && ageInput.isNotEmpty)
            ? int.tryParse(ageInput) ?? existingUser.data?.age ?? 0
            : existingUser.data?.age ?? 0;

        stdout.write(
          "Enter new Nationality (leave blank to keep '${existingUser.data?.nationality}'): ",
        );
        final nationality = stdin.readLineSync()?.trim();
        final updatedNationality =
            (nationality != null && nationality.isNotEmpty)
            ? nationality
            : existingUser.data?.nationality ?? '';

        final updatedUser = existingUser.copyWith(
          name: updatedName,
          data: existingUser.data?.copyWith(
            fName: updatedFName,
            lName: updatedLName,
            birthYear: updatedBirthYear,
            age: updatedAge,
            nationality: updatedNationality,
          ),
        );

        await fileService.update(idInput, updatedUser);
        print("User updated successfully!");
      } catch (e) {
        print("Error: ${e.toString()}");
      }
    } else {
      print(
        "Unknown option after -f. || Use -c for create || -FI for find by ID. ||  -fa for find all. || -di for delete by ID || -da for delete all || -u for update.",
      );
    }

    // Server mode
  } else if (arguments[0] == "-s") {
    if (arguments.length < 2) {
      print("Usage: -s -c (create)");
      return;
    }

    final serverService = UserServerService();

    // Create User
    if (arguments[1] == "-c") {
      try {
        stdout.write("Enter Name: ");
        final name = stdin.readLineSync()?.trim();
        if (name == null || name.isEmpty) throw Exception("Name is required!");

        stdout.write("Enter First Name: ");
        final fName = stdin.readLineSync()?.trim();
        if (fName == null || fName.isEmpty) {
          throw Exception("First name is required!");
        }

        stdout.write("Enter Last Name: ");
        final lName = stdin.readLineSync()?.trim();
        if (lName == null || lName.isEmpty) {
          throw Exception("Last name is required!");
        }

        stdout.write("Enter Birth Year: ");
        final birthYear = stdin.readLineSync()?.trim();
        if (birthYear == null ||
            birthYear.isEmpty ||
            int.tryParse(birthYear) == null) {
          throw Exception("Invalid birth year!");
        }

        stdout.write("Enter Age: ");
        final ageInput = stdin.readLineSync()?.trim();
        final age = int.tryParse(ageInput ?? "");
        if (age == null) throw Exception("Invalid age!");

        stdout.write("Enter Nationality: ");
        final nationality = stdin.readLineSync()?.trim();
        if (nationality == null || nationality.isEmpty) {
          throw Exception("Nationality is required!");
        }

        final newUser = UserDetails(
          name: name,
          data: UserData(
            id: DateTime.now().millisecondsSinceEpoch,
            fName: fName,
            lName: lName,
            birthYear: birthYear,
            age: age,
            nationality: nationality,
          ),
        );

        await serverService.create(newUser);
        print("User created successfully on the server!");
      } catch (e) {
        print("Error: $e");
      }
      // Find by all
    } else if (arguments[1] == "-fa") {
      try {
        final users = await serverService.findAll();
        if (users.isEmpty) {
          print("No users found.");
        } else {
          print("All Users:");
          for (var user in users) {
            print("---------------");
            print("ID: ${user.data?.id}");
            print("Name: ${user.name}");
            print("First Name: ${user.data?.fName}");
            print("Last Name: ${user.data?.lName}");
            print("Birth Year: ${user.data?.birthYear}");
            print("Age: ${user.data?.age}");
            print("Nationality: ${user.data?.nationality}");
          }
        }
      } catch (e) {
        print("Error: ${e.toString()}");
      }
    }
    // Find by id
    else if (arguments[1] == "-fi") {
      try {
        stdout.write("Enter User ID: ");
        final idInput = stdin.readLineSync()?.trim();
        if (idInput == null || idInput.isEmpty) {
          throw Exception("User ID is required!");
        }

        final user = await serverService.findByID(idInput);

        if (user != null) {
          print("User found!");
          print("Name: ${user.name}");
          print("First Name: ${user.data?.fName}");
          print("Last Name: ${user.data?.lName}");
          print("Age: ${user.data?.age}");
          print("Birth Year: ${user.data?.birthYear}");
          print("Nationality: ${user.data?.nationality}");
        } else {
          print("No user found with ID: $idInput");
        }
      } catch (e) {
        print("Error: ${e.toString()}");
      }
    }
    // Delete by id
    else if (arguments[1] == "-di") {
      try {
        stdout.write("Enter User ID to delete: ");
        final idInput = stdin.readLineSync()?.trim();
        if (idInput == null || idInput.isEmpty) {
          throw Exception("User ID is required!");
        }

        await serverService.delete(idInput);
        print("User with ID $idInput deleted successfully from the server.");
      } catch (e) {
        print("Error: ${e.toString()}");
      }
    }
    // Delete All
    else if (arguments[1] == "-da") {
      try {
        stdout.write("Are you sure you want to delete all users? (yes/no): ");
        final confirmation = stdin.readLineSync()?.trim().toLowerCase();
        if (confirmation == 'yes' || confirmation == 'y') {
          await serverService.deleteAll();
          print("All users deleted successfully from the server.");
        } else {
          print("Operation cancelled.");
        }
      } catch (e) {
        print("Error: ${e.toString()}");
      }
    }
    // Update User
    else if (arguments[1] == "-u") {
      try {
        stdout.write("Enter User ID to update: ");
        final idInput = stdin.readLineSync()?.trim();
        if (idInput == null || idInput.isEmpty) {
          throw Exception("User ID is required!");
        }

        final existingUser = await serverService.findByID(idInput);
        if (existingUser == null) {
          print("No user found with ID: $idInput");
          return;
        }

        stdout.write(
          "Enter new Name (leave blank to keep '${existingUser.name}'): ",
        );
        final name = stdin.readLineSync()?.trim();
        final updatedName = name?.isNotEmpty == true
            ? name
            : existingUser.name ?? '';

        stdout.write(
          "Enter new First Name (leave blank to keep '${existingUser.data?.fName}'): ",
        );
        final fName = stdin.readLineSync()?.trim();
        final updatedFName = fName?.isNotEmpty == true
            ? fName
            : existingUser.data?.fName ?? '';

        stdout.write(
          "Enter new Last Name (leave blank to keep '${existingUser.data?.lName}'): ",
        );
        final lName = stdin.readLineSync()?.trim();
        final updatedLName = lName?.isNotEmpty == true
            ? lName
            : existingUser.data?.lName ?? '';

        stdout.write(
          "Enter new Birth Year (leave blank to keep '${existingUser.data?.birthYear}'): ",
        );
        final birthYear = stdin.readLineSync()?.trim();
        final updatedBirthYear = birthYear?.isNotEmpty == true
            ? birthYear
            : existingUser.data?.birthYear ?? '';

        stdout.write(
          "Enter new Age (leave blank to keep '${existingUser.data?.age}'): ",
        );
        final ageInput = stdin.readLineSync()?.trim();
        final updatedAge = ageInput?.isNotEmpty == true
            ? int.tryParse(ageInput!) ?? existingUser.data?.age ?? 0
            : existingUser.data?.age ?? 0;

        stdout.write(
          "Enter new Nationality (leave blank to keep '${existingUser.data?.nationality}'): ",
        );
        final nationality = stdin.readLineSync()?.trim();
        final updatedNationality = nationality?.isNotEmpty == true
            ? nationality
            : existingUser.data?.nationality ?? '';

        final updatedUser = UserDetails(
          id: existingUser.id,
          name: updatedName,
          data: UserData(
            fName: updatedFName,
            lName: updatedLName,
            birthYear: updatedBirthYear,
            age: updatedAge,
            nationality: updatedNationality,
          ),
        );

        await serverService.update(idInput, updatedUser);
        print("User updated successfully!");
      } catch (e) {
        print("Error updating user: $e");
      }
    } else {
      print("Invalid argument. Use -f (file mode) or -s (server mode)");
    }
  }
}

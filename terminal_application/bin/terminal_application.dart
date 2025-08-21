import 'dart:io';

Future<void> main(List<String> arguments) async {
  if (arguments.length < 2 || arguments[0] != "-f") {
    print("Usage: terminal_application -f {FileName} [-p {Path}]");
    exit(1);
  }

  final featureName = arguments[1];
  final basedir = Directory("bin/src/features/$featureName").absolute.path;
  final platForm = Platform.operatingSystem;
  print("Feature name: $featureName");
  print("Base directory: $basedir");
  print("plateform: $platForm");

  final dataDir = Directory("$basedir/data_$platForm");
  if (!await dataDir.exists()) {
    print("Creating data directory: $dataDir");
    await dataDir.create(recursive: true);
  } else {
    print("Data directory already exists: $dataDir");
  }

  final presentationDir = Directory("$basedir/presentation_$platForm");
  if (!await presentationDir.exists()) {
    print("Creating presentation directory: $presentationDir");
    await presentationDir.create(recursive: true);
  } else {
    print("Presentation directory already exists: $presentationDir");
  }

  await _createFile(
    "${dataDir.path}/api.dart",
    "void main() => print('API file for api.dart');",
  );
  await _createFile(
    "${dataDir.path}/repository.dart",
    "void main() => print('Repository file for repository.dart');",
  );
  await _createFile(
    "${dataDir.path}/controller.dart",
    "void main() => print('Controller file for controller.dart');",
  );
  await _createFile(
    "${presentationDir.path}/ui.dart",
    "void main() => print('UI file for ui.dart');",
  );
  await _createFile(
    "${presentationDir.path}/widget.dart",
    "void main() => print('Widget file for widget.dart');",
  );

  if (arguments.length >= 4 && arguments[2] == "-p") {
    final customPath = arguments[3];
    final sourceDir = Directory(customPath);

    if (await sourceDir.exists()) {
      final lastName = sourceDir.uri.pathSegments.isNotEmpty
          ? sourceDir.uri.pathSegments[sourceDir.uri.pathSegments.length - 2]
          : "extra";

      print("Custom path provided: $customPath");
      print("Last name from path: $lastName");

      final newTargetDir = Directory("$basedir/$lastName");
      if (!await newTargetDir.exists()) {
        await newTargetDir.create(recursive: true);
      }

      print("Copying content of $customPath into $newTargetDir ...");
      await _copyDirectoryStructure(sourceDir, newTargetDir);
    } else {
      print("Provided path does not exist: $customPath");
    }
  }
}

Future<void> _createFile(String path, String content) async {
  final file = File(path);
  if (!await file.exists()) {
    print("Creating file: $path");
    await file.create(recursive: true);
    await file.writeAsString(content);
  } else {
    print("File already exists: $path");
  }
}

Future<void> _copyDirectoryStructure(
  Directory source,
  Directory destination,
) async {
  await for (var entity in source.list(recursive: true)) {
    if (entity is File) {
      final relativePath = entity.path.replaceFirst(source.path, "");
      final newFile = File("${destination.path}$relativePath");
      if (!await newFile.exists()) {
        await newFile.create(recursive: true);
        print("Created file: ${newFile.path}");
      }
    } else if (entity is Directory) {
      final relativePath = entity.path.replaceFirst(source.path, "");
      final newDir = Directory("${destination.path}$relativePath");
      if (!await newDir.exists()) {
        await newDir.create(recursive: true);
        print("Created directory: ${newDir.path}");
      }
    }
  }
}

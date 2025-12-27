import 'dart:io';
import '../models/mount_point.dart';

class NfsService {
  /// 마운트 실행
  ///
  /// 1. 로컬 디렉토리가 없으면 생성 (현재 사용자 권한)
  /// 2. osascript를 사용하여 관리자 권한으로 mount 명령 실행
  Future<void> mount(MountPoint mountPoint) async {
    final resolvedLocalPath = _resolvePath(mountPoint.localPath);

    // 1. 로컬 디렉토리 생성 (사용자 권한)
    final directory = Directory(resolvedLocalPath);
    if (!await directory.exists()) {
      try {
        await directory.create(recursive: true);
      } catch (e) {
        throw Exception('로컬 디렉토리 생성 실패: $e');
      }
    }

    // 2. 마운트 명령 구성
    // -o resvport: macOS에서 보안 포트 사용을 위해 필요
    // -o rw: 읽기/쓰기
    // -o nfc: 유니코드 정규화 (macOS/Linux 호환성)
    final command =
        'mount -t nfs -o resvport,rw,nfc "${mountPoint.serverAddress}:${mountPoint.serverPath}" "$resolvedLocalPath"';

    // 3. AppleScript로 실행 (관리자 암호 프롬프트 표시)
    // AppleScript 내부에서 사용할 때 command 내의 쌍따옴표를 이스케이프 처리해야 함
    final script =
        'do shell script "${command.replaceAll('"', '\\"')}" with administrator privileges';
    final processResult = await Process.run('osascript', ['-e', script]);

    if (processResult.exitCode != 0) {
      throw Exception('마운트 실패: ${processResult.stderr}');
    }
  }

  /// 언마운트 실행
  Future<void> unmount(MountPoint mountPoint) async {
    final resolvedLocalPath = _resolvePath(mountPoint.localPath);

    // 언마운트 명령 구성
    final command = 'umount -f "$resolvedLocalPath"';

    // AppleScript로 실행
    final script =
        'do shell script "${command.replaceAll('"', '\\"')}" with administrator privileges';
    final processResult = await Process.run('osascript', ['-e', script]);

    if (processResult.exitCode != 0) {
      throw Exception('언마운트 실패: ${processResult.stderr}');
    }
  }

  String _resolvePath(String path) {
    if (path.startsWith('~/')) {
      final home = Platform.environment['HOME'];
      if (home != null) {
        return path.replaceFirst('~', home);
      }
    } else if (path == '~') {
      final home = Platform.environment['HOME'];
      if (home != null) {
        return home;
      }
    }
    return path;
  }
}

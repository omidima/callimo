import 'dart:convert';

import '../message/message_dto.dart';

class MessageFile {
  String? hash;
  int? size;
  String? name;
  String? mimeType;
  Props? metadata;
  String? extension;
  bool? hasPrevirew;

  MessageFile({
    this.size,
    this.name,
    this.hash,
    this.metadata,
    this.mimeType,
    this.hasPrevirew,
    this.extension,
  });

  MessageFile.fromJson(dynamic json) {
    size = json['size'];
    name = json['name'];
    hash = json['hash'];
    metadata =
        json['metadata'] != null ? Props.fromJson(json['metadata']) : null;
    ;
    mimeType = json['mime_type'];
    hasPrevirew = json['has_preview_image'];
    extension = json['extension'];
  }

  Map<String, dynamic> toJson() => {
        'hash': hash,
        'size': size,
        'name': name,
        'mime_type': mimeType,
        'has_preview_image': hasPrevirew,
        'extension': extension,
        'metadata': this.metadata != null ? metadata!.toJson() : null,
      };

    
}

class FilesDto {
  String? hash;
  int? size;
  String? name;
  String? mimeType;
  int? createAt;
  Props? metadata;
  String? path;

  FilesDto({
    this.hash,
    this.size,
    this.name,
    this.mimeType,
    this.createAt,
    this.metadata,
    this.path,
  });

  FilesDto.fromJson(dynamic json) {
    this.hash = json['hash'];
    this.size = json['size'];
    this.name = json['name'];
    this.mimeType = json['mime_type'];
    this.metadata =
        json['metadata'] != null ? Props.fromJson(json['metadata']) : null;
    ;
  }

  FilesDto.fromFileInfo(FileInfoDto file) {
    hash = file.hash;
    size = file.size;
    name = file.name;
    mimeType = file.mimeType;
    metadata =
    file.metadata != null ? file.metadata : null;
    createAt = file.createAt;
    ;
  }

  Map<String, dynamic> toJson() => {
        'hash': hash,
        'size': size,
        'name': name,
        'mime_type': mimeType,
        'metadata': this.metadata != null ? metadata!.toJson() : null,
      };
}

class FileInfoDto {
  String? hash;
  int? size;
  String? name;
  String? mimeType;
  int? createAt;
  Props? metadata;
  String? path;

  FileInfoDto({
    this.hash,
    this.size,
    this.name,
    this.mimeType,
    this.createAt,
    this.metadata,
    this.path,
  });

  FileInfoDto.fromJson(dynamic json) {
    hash = json['hash'];
    size = json['size'];
    name = json['name'];
    mimeType = json['contentType'];
    createAt = json['createAt'];
    metadata =
        json['metadata'] != null ? Props.fromJson(json['metadata']) : null;
    ;
  }

  Map<String, dynamic> toJson() => {
        'hash': hash,
        'size': size,
        'name': name,
        'contentType': mimeType,
        'createAt': DateTime.now().millisecondsSinceEpoch,
        'metadata': metadata,
      };

  convertToFileDto() {
    return FilesDto(
      createAt: createAt,
      hash: hash,
      metadata: metadata != null ? metadata : null,
      mimeType: mimeType,
      name: name,
      size: size
    );
  }
}

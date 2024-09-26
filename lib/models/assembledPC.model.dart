// import 'package:flutter/material.dart';

class AssembledPC {
  final List<String> urlImage;
  final String namePC;
  final bool wifi;
  final String color;
  final StorageMedia storageMedia;
  final Memory memory;
  final String powerSuppy;
  final String software;
  final CPU cpu;
  final GPU gpu;

  AssembledPC(
      {required this.urlImage,
      required this.namePC,
      required this.wifi,
      required this.color,
      required this.storageMedia,
      required this.memory,
      required this.powerSuppy,
      required this.software,
      required this.cpu,
      required this.gpu});

  factory AssembledPC.fromJson(Map<String, dynamic> json) {
    return AssembledPC(
      urlImage: List<String>.from(json['url_image']),
      namePC: json['name_pc'],
      wifi: json['wifi'],
      color: json['color'],
      storageMedia: StorageMedia.fromJson(json['storage_media']),
      memory: Memory.fromJson(json['memory']),
      powerSuppy: json['power_supply'],
      software: json['software'],
      cpu: CPU.fromJson(json['cpu']),
      gpu: GPU.fromJson(json['gpu']),
    );
  }
}

class StorageMedia {
  final String storageUnitsInstalled;
  final String storageUnit;
  final String totalStorageCapacity;

  StorageMedia(
      {required this.storageUnitsInstalled,
      required this.storageUnit,
      required this.totalStorageCapacity});

  factory StorageMedia.fromJson(Map<String, dynamic> json) {
    return StorageMedia(
      storageUnitsInstalled: json['storage_units_installed'],
      storageUnit: json['storage_unit'],
      totalStorageCapacity: json['total_storage_capacity'],
    );
  }
}

class Memory {
  final String memoryRam;
  final String memoryVelocity;

  Memory({required this.memoryRam, required this.memoryVelocity});

  factory Memory.fromJson(Map<String, dynamic> json) {
    return Memory(
      memoryRam: json['memory_ram'],
      memoryVelocity: json['memory_velocity'],
    );
  }
}

class CPU {
  final String cpu;
  final String cpuCache;
  final String cpuCores;
  final String cpuFamily;
  final String cpuGeneration;
  final String cpuMemorySupported;
  final String cpuModel;
  final String cpuSocket;
  final String cpuTurboFrecuency;

  CPU(
      {required this.cpu,
      required this.cpuCache,
      required this.cpuCores,
      required this.cpuFamily,
      required this.cpuGeneration,
      required this.cpuMemorySupported,
      required this.cpuModel,
      required this.cpuSocket,
      required this.cpuTurboFrecuency});

  factory CPU.fromJson(Map<String, dynamic> json) {
    return CPU(
      cpu: json['cpu'],
      cpuCache: json['cpu_cache'],
      cpuCores: json['cpu_cores'],
      cpuFamily: json['cpu_family'],
      cpuGeneration: json['cpu_generation'],
      cpuMemorySupported: json['cpu_memory_supported'],
      cpuModel: json['cpu_model'],
      cpuSocket: json['cpu_socket'],
      cpuTurboFrecuency: json['cpu_turbo_frecuency'],
    );
  }
}

class GPU {
  final String gpuLine;
  final String gpuName;
  final String gpuDiscreteModel;

  GPU(
      {required this.gpuLine,
      required this.gpuName,
      required this.gpuDiscreteModel});

  factory GPU.fromJson(Map<String, dynamic> json) {
    return GPU(
      gpuLine: json['gpu_line'],
      gpuName: json['gpu_name'],
      gpuDiscreteModel: json['gpu_discrete_model'],
    );
  }
}

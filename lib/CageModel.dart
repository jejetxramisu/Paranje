class CageModel {
  Data? data;
  String? message;

  CageModel({this.data, this.message});

  CageModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  Meta? meta;
  List<Datas>? data;

  Data({this.meta, this.data});

  Data.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    if (json['data'] != null) {
      data = <Datas>[];
      json['data'].forEach((v) {
        data!.add(new Datas.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Meta {
  bool? status;
  int? code;
  String? message;
  int? currentPage;
  bool? nextPage;
  bool? prevPage;
  int? perPage;
  int? pageCount;
  int? totalCount;

  Meta(
      {this.status,
      this.code,
      this.message,
      this.currentPage,
      this.nextPage,
      this.prevPage,
      this.perPage,
      this.pageCount,
      this.totalCount});

  Meta.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    currentPage = json['current_page'];
    nextPage = json['next_page'];
    prevPage = json['prev_page'];
    perPage = json['per_page'];
    pageCount = json['page_count'];
    totalCount = json['total_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['code'] = this.code;
    data['message'] = this.message;
    data['current_page'] = this.currentPage;
    data['next_page'] = this.nextPage;
    data['prev_page'] = this.prevPage;
    data['per_page'] = this.perPage;
    data['page_count'] = this.pageCount;
    data['total_count'] = this.totalCount;
    return data;
  }
}

class Datas {
  String? id;
  String? name;
  String? cageCode;
  String? cityId;
  String? city;
  String? cageStaff;
  String? fieldSupervisor;
  String? chickenCategoryId;
  String? chickenCategory;
  String? cageCoordinate;
  String? chickSource;
  String? farmId;
  String? farm;
  String? branchId;
  String? branch;
  String? logCycleId;
  String? logCycleCode;
  String? logActivityId;
  String? logActivity;
  String? workDateStart;
  String? workDateEnd;
  int? sequence;
  int? totalArea;
  int? height;
  int? width;
  String? cageCategoryId;
  String? cageCategory;
  int? chickCapacity;
  int? fan;
  int? floor;
  int? heater;
  int? deadChicken;
  int? population;
  int? populationCage;
  int? weightSample;
  int? productionStatus;
  String? installmentAdministrationId;
  String? acquisitionId;
  String? acquisitionName;
  int? totalHarvest;
  int? isYesterday;
  String? createdAt;
  String? updatedAt;

  Datas(
      {this.id,
      this.name,
      this.cageCode,
      this.cityId,
      this.city,
      this.cageStaff,
      this.fieldSupervisor,
      this.chickenCategoryId,
      this.chickenCategory,
      this.cageCoordinate,
      this.chickSource,
      this.farmId,
      this.farm,
      this.branchId,
      this.branch,
      this.logCycleId,
      this.logCycleCode,
      this.logActivityId,
      this.logActivity,
      this.workDateStart,
      this.workDateEnd,
      this.sequence,
      this.totalArea,
      this.height,
      this.width,
      this.cageCategoryId,
      this.cageCategory,
      this.chickCapacity,
      this.fan,
      this.floor,
      this.heater,
      this.deadChicken,
      this.population,
      this.populationCage,
      this.weightSample,
      this.productionStatus,
      this.installmentAdministrationId,
      this.acquisitionId,
      this.acquisitionName,
      this.totalHarvest,
      this.isYesterday,
      this.createdAt,
      this.updatedAt});

  Datas.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    cageCode = json['cage_code'];
    cityId = json['city_id'];
    city = json['city'];
    cageStaff = json['cage_staff'];
    fieldSupervisor = json['field_supervisor'];
    chickenCategoryId = json['chicken_category_id'];
    chickenCategory = json['chicken_category'];
    cageCoordinate = json['cage_coordinate'];
    chickSource = json['chick_source'];
    farmId = json['farm_id'];
    farm = json['farm'];
    branchId = json['branch_id'];
    branch = json['branch'];
    logCycleId = json['log_cycle_id'];
    logCycleCode = json['log_cycle_code'];
    logActivityId = json['log_activity_id'];
    logActivity = json['log_activity'];
    workDateStart = json['work_date_start'];
    workDateEnd = json['work_date_end'];
    sequence = json['sequence'];
    totalArea = json['total_area'];
    height = json['height'];
    width = json['width'];
    cageCategoryId = json['cage_category_id'];
    cageCategory = json['cage_category'];
    chickCapacity = json['chick_capacity'];
    fan = json['fan'];
    floor = json['floor'];
    heater = json['heater'];
    deadChicken = json['dead_chicken'];
    population = json['population'];
    populationCage = json['population_cage'];
    weightSample = json['weight_sample'];
    productionStatus = json['production_status'];
    installmentAdministrationId = json['installment_administration_id'];
    acquisitionId = json['acquisition_id'];
    acquisitionName = json['acquisition_name'];
    totalHarvest = json['total_harvest'];
    isYesterday = json['is_yesterday'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['cage_code'] = this.cageCode;
    data['city_id'] = this.cityId;
    data['city'] = this.city;
    data['cage_staff'] = this.cageStaff;
    data['field_supervisor'] = this.fieldSupervisor;
    data['chicken_category_id'] = this.chickenCategoryId;
    data['chicken_category'] = this.chickenCategory;
    data['cage_coordinate'] = this.cageCoordinate;
    data['chick_source'] = this.chickSource;
    data['farm_id'] = this.farmId;
    data['farm'] = this.farm;
    data['branch_id'] = this.branchId;
    data['branch'] = this.branch;
    data['log_cycle_id'] = this.logCycleId;
    data['log_cycle_code'] = this.logCycleCode;
    data['log_activity_id'] = this.logActivityId;
    data['log_activity'] = this.logActivity;
    data['work_date_start'] = this.workDateStart;
    data['work_date_end'] = this.workDateEnd;
    data['sequence'] = this.sequence;
    data['total_area'] = this.totalArea;
    data['height'] = this.height;
    data['width'] = this.width;
    data['cage_category_id'] = this.cageCategoryId;
    data['cage_category'] = this.cageCategory;
    data['chick_capacity'] = this.chickCapacity;
    data['fan'] = this.fan;
    data['floor'] = this.floor;
    data['heater'] = this.heater;
    data['dead_chicken'] = this.deadChicken;
    data['population'] = this.population;
    data['population_cage'] = this.populationCage;
    data['weight_sample'] = this.weightSample;
    data['production_status'] = this.productionStatus;
    data['installment_administration_id'] = this.installmentAdministrationId;
    data['acquisition_id'] = this.acquisitionId;
    data['acquisition_name'] = this.acquisitionName;
    data['total_harvest'] = this.totalHarvest;
    data['is_yesterday'] = this.isYesterday;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

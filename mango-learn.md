# MongoDB 学习手册
## 目录

### 1. MongoDB 简介
- [1.1 什么是MongoDB？](#11-什么是-mongodb)
- [1.2 MongoDB的特点](#12-mongodb-的特点)
- [1.3 MongoDB的应用场景](#13-mongodb-的应用场景)

### 2. MongoDB 基础
- [2.1 安装MongoDB](#21-安装-mongodb)
  - [2.1.1 下载MongoDB](#211-下载-mongodb)
  - [2.1.2 安装MongoDB](#212-安装-mongodb)
  - [2.1.3 启动MongoDB](#213-启动-mongodb)
- [2.2 MongoDB的基本概念](#22-mongodb-的基本概念)
- [2.3 MongoDB的数据模型](#23-mongodb-的数据模型)
  - [2.3.1 文档结构示例](#231-文档结构示例)
  - [2.3.2 数据模型设计模式](#232-数据模型设计模式)

### 3. MongoDB 操作
- [3.1 连接MongoDB](#31-连接-mongodb)
- [3.2 创建数据库和集合](#32-创建数据库和集合)
  - [3.2.1 创建数据库](#321-创建数据库)
  - [3.2.2 创建集合](#322-创建集合)
- [3.3 插入文档](#33-插入文档)
- [3.4 查询文档](#34-查询文档)
  - [3.4.1 基础查询操作](#341-基础查询操作)
  - [3.4.2 高级查询操作](#342-高级查询操作)
  - [3.4.3 投影查询](#343-投影查询)
  - [3.4.4 排序和分页](#344-排序和分页)
- [3.5 更新文档](#35-更新文档)
- [3.6 删除文档](#36-删除文档)

### 4. MongoDB 高级操作
- [4.1 索引](#41-索引)
  - [4.1.1 单字段索引](#411-单字段索引)
  - [4.1.2 复合索引](#412-复合索引)
  - [4.1.3 多键索引](#413-多键索引)
  - [4.1.4 地理空间索引](#414-地理空间索引)
  - [4.1.5 文本索引](#415-文本索引)
  - [4.1.6 部分索引](#416-部分索引)
  - [4.1.7 索引属性](#417-索引属性)
  - [4.1.8 索引管理](#418-索引管理)
- [4.2 聚合框架](#42-聚合框架)
  - [4.2.1 基本聚合操作](#421-基本聚合操作)
  - [4.2.2 多阶段聚合](#422-多阶段聚合)
- [4.3 事务](#43-事务)
  - [4.3.1 事务基础](#431-事务基础)
  - [4.3.2 事务操作示例](#432-事务操作示例)
- [4.4 复制集](#44-复制集)
  - [4.4.1 复制集配置](#441-复制集配置)
  - [4.4.2 复制集状态监控](#442-复制集状态监控)
- [4.5 分片](#45-分片)
  - [4.5.1 分片集群配置](#451-分片集群配置)
  - [4.5.2 分片管理](#452-分片管理)
- [4.6 数据备份与恢复](#46-数据备份与恢复)
  - [4.6.1 备份操作](#461-备份操作)
  - [4.6.2 恢复操作](#462-恢复操作)
- [4.7 性能优化](#47-性能优化)
  - [4.7.1 查询优化](#471-查询优化)
  - [4.7.2 写入优化](#472-写入优化)
  - [4.7.3 索引优化](#473-索引优化)
[前面的章节保持不变...]

### 5. MongoDB 集群架构 [↑](#目录)
- [5.1 复制集架构](#51-复制集架构)
  - [5.1.1 复制集概念](#511-复制集概念)
  - [5.1.2 复制集部署](#512-复制集部署)
  - [5.1.3 复制集维护](#513-复制集维护)
- [5.2 分片集群架构](#52-分片集群架构)
  - [5.2.1 分片集群组件](#521-分片集群组件)
  - [5.2.2 分片集群部署](#522-分片集群部署)
  - [5.2.3 分片集群维护](#523-分片集群维护)
- [5.3 高可用配置](#53-高可用配置)
  - [5.3.1 自动故障转移](#531-自动故障转移)
  - [5.3.2 读写分离](#532-读写分离)
- [5.4 集群监控](#54-集群监控)
  - [5.4.1 监控指标](#541-监控指标)
  - [5.4.2 监控工具](#542-监控工具)

### 6. MongoDB 安全
- [6.1 用户认证](#61-用户认证)
  - [6.1.1 创建用户](#611-创建用户)
  - [6.1.2 用户管理](#612-用户管理)
- [6.2 访问控制](#62-访问控制)
  - [6.2.1 角色管理](#621-角色管理)
  - [6.2.2 认证配置](#622-认证配置)
- [6.3 数据加密](#63-数据加密)
  - [6.3.1 传输加密(TLS/SSL)](#631-传输加密tlsssl)
  - [6.3.2 静态数据加密](#632-静态数据加密)

### 7. MongoDB 备份与恢复
- [7.1 备份策略](#71-备份策略)
- [7.2 恢复策略](#72-恢复策略)

### 8. MongoDB 监控与日志
- [8.1 监控工具](#81-监控工具)
  - [8.1.1 数据库状态监控](#811-数据库状态监控)
  - [8.1.2 性能监控](#812-性能监控)
  - [8.1.3 慢查询分析](#813-慢查询分析)
- [8.2 日志管理](#82-日志管理)
  - [8.2.1 日志配置](#821-日志配置)
  - [8.2.2 日志分析](#822-日志分析)

### 9. MongoDB 客户端工具
- [9.1 MongoDB Shell](#91-mongodb-shell)
  - [9.1.1 基本操作](#911-基本操作)
  - [9.1.2 自定义函数](#912-自定义函数)
- [9.2 MongoDB Compass](#92-mongodb-compass)
  - [9.2.1 查询构建器](#921-查询构建器)
  - [9.2.2 性能分析](#922-性能分析)
- [9.3 Robo 3T (Studio 3T)](#93-robo-3t-studio-3t)
  - [9.3.1 可视化操作](#931-可视化操作)
  - [9.3.2 导入导出](#932-导入导出)

### 10. MongoDB 实战案例
- [10.1 电商系统](#101-电商系统)
- [10.2 社交网络](#102-社交网络)
- [10.3 日志分析](#103-日志分析)
- [10.4 内容管理系统(CMS)](#104-内容管理系统cms)

### 11. MongoDB 最佳实践
- [11.2 性能优化最佳实践](#112-性能优化最佳实践)
  - [11.2.1 查询优化](#1121-查询优化)
  - [11.2.2 写入优化](#1122-写入优化)
- [11.3 运维最佳实践](#113-运维最佳实践)
  - [11.3.1 监控和告警](#1131-监控和告警)
  - [11.3.2 备份策略](#1132-备份策略)

### 12. MongoDB 高级特性
- [12.1 Change Streams](#121-change-streams)
- [12.2 GridFS 大文件存储](#122-gridfs-大文件存储)
- [12.3 地理空间查询](#123-地理空间查询)

[前面的章节保持不变...]

### 13. MongoDB 性能调优进阶
- [13.1 查询优化进阶](#131-查询优化进阶)
- [13.2 聚合管道优化](#132-聚合管道优化)
- [13.3 写入性能优化](#133-写入性能优化)
- [13.4 内存优化](#134-内存优化)

### 14. MongoDB 故障排查指南
- [14.1 常见问题诊断](#141-常见问题诊断)
- [14.2 故障排查工具](#142-故障排查工具)
- [14.3 故障恢复](#143-故障恢复)
  - [14.3.1 数据恢复](#1431-数据恢复)
  - [14.3.2 服务恢复](#1432-服务恢复)
- [14.4 预防性维护](#144-预防性维护)
  - [14.4.1 健康检查](#1441-健康检查)



## 1. MongoDB 简介[](#目录)

### 1.1 什么是 MongoDB？[](#目录)

MongoDB 是一个开源的、面向文档的 NoSQL 数据库，使用 JSON 风格的文档存储数据。它具有高性能、高可用性和可扩展性，适用于大规模数据存储和实时数据处理。

### 1.2 MongoDB 的特点[](#目录)

- **面向文档**：使用 BSON（二进制的 JSON）格式存储数据，支持嵌套文档和数组。
- **高性能**：通过索引和内存映射文件技术，提供高性能的数据读写。
- **高可用性**：支持复制集（Replica Set），提供数据冗余和自动故障恢复。
- **可扩展性**：支持分片（Sharding），通过水平扩展提高数据处理能力。
- **灵活性**：无需预定义模式（Schema），支持动态数据模型。

### 1.3 MongoDB 的应用场景[](#目录)

- **实时数据分析**：适用于需要快速查询和分析大规模数据的场景。
- **内容管理系统**：适用于存储和管理大量非结构化数据。
- **日志和事件数据**：适用于存储和分析日志和事件数据。
- **实时应用**：适用于需要实时数据处理和更新的应用。

## 2. MongoDB 基础[](#目录)

### 2.1 安装 MongoDB[](#目录)

#### 2.1.1 下载 MongoDB

从 MongoDB 官方网站下载适合操作系统的安装包。

#### 2.1.2 安装 MongoDB

按照安装向导进行安装，配置 MongoDB 服务。

#### 2.1.3 启动 MongoDB

启动 MongoDB 服务，确保服务正常运行。

### 2.2 MongoDB 的基本概念

- **数据库（Database）**：MongoDB 中的数据库，类似于关系型数据库中的数据库。
- **集合（Collection）**：MongoDB 中的集合，类似于关系型数据库中的表。
- **文档（Document）**：MongoDB 中的文档，类似于关系型数据库中的记录。
- **字段（Field）**：MongoDB 中的字段，类似于关系型数据库中的列。

### 2.3 MongoDB 的数据模型 [](#目录)

#### 2.3.1 文档结构示例
```python
from datetime import datetime
from bson import ObjectId

# 基础文档结构示例
user_doc = {
    "_id": ObjectId(),
    "username": "john_doe",
    "email": "john@example.com",
    # 嵌入式文档
    "address": {
        "street": "123 Main St",
        "city": "Beijing",
        "country": "China"
    },
    # 数组
    "tags": ["python", "mongodb", "web"],
    # 嵌入式文档数组
    "comments": [
        {
            "user": "user1",
            "content": "Great post!",
            "created_at": datetime.utcnow()
        }
    ]
}

# 数据模型示例
class MongoDBModels:
    def __init__(self, db):
        self.db = db
        
    def create_user(self, user_data):
        """创建用户文档"""
        user = {
            "username": user_data["username"],
            "email": user_data["email"],
            "created_at": datetime.utcnow(),
            "profile": {
                "full_name": user_data.get("full_name", ""),
                "age": user_data.get("age"),
                "interests": user_data.get("interests", [])
            }
        }
        return self.db.users.insert_one(user)

    def create_order(self, order_data):
        """创建订单文档"""
        order = {
            "order_id": f"ORD{ObjectId()}",
            "user_id": order_data["user_id"],
            "items": [
                {
                    "product_id": item["product_id"],
                    "quantity": item["quantity"],
                    "price": item["price"]
                }
                for item in order_data["items"]
            ],
            "total_amount": sum(item["price"] * item["quantity"] 
                              for item in order_data["items"]),
            "status": "pending",
            "created_at": datetime.utcnow()
        }
        return self.db.orders.insert_one(order)
```

#### 2.3.2 数据模型设计模式[](#目录)
```python
from typing import List, Dict, Optional
from dataclasses import dataclass
from datetime import datetime

@dataclass
class Address:
    street: str
    city: str
    country: str
    postal_code: Optional[str] = None

@dataclass
class UserProfile:
    full_name: str
    age: int
    email: str
    address: Address
    interests: List[str] = None

class MongoDBPatterns:
    def __init__(self, db):
        self.db = db

    def embedded_pattern(self, user_profile: UserProfile):
        """嵌入式模式示例"""
        user_doc = {
            "profile": {
                "full_name": user_profile.full_name,
                "age": user_profile.age,
                "email": user_profile.email,
                "address": {
                    "street": user_profile.address.street,
                    "city": user_profile.address.city,
                    "country": user_profile.address.country,
                    "postal_code": user_profile.address.postal_code
                }
            },
            "interests": user_profile.interests or [],
            "created_at": datetime.utcnow()
        }
        return self.db.users.insert_one(user_doc)

    def reference_pattern(self, user_id: ObjectId, order_data: Dict):
        """引用模式示例"""
        # 创建订单文档
        order = {
            "user_id": user_id,  # 引用用户ID
            "items": order_data["items"],
            "total_amount": order_data["total_amount"],
            "status": "pending",
            "created_at": datetime.utcnow()
        }
        order_id = self.db.orders.insert_one(order).inserted_id

        # 更新用户的订单引用
        self.db.users.update_one(
            {"_id": user_id},
            {"$push": {"order_ids": order_id}}
        )
        return order_id

    def bucket_pattern(self, user_id: ObjectId, log_entry: Dict):
        """桶模式示例"""
        # 按天分桶存储日志
        bucket_date = datetime.utcnow().date()
        
        self.db.user_logs.update_one(
            {
                "user_id": user_id,
                "date": bucket_date
            },
            {
                "$push": {
                    "logs": {
                        "action": log_entry["action"],
                        "timestamp": datetime.utcnow(),
                        "details": log_entry["details"]
                    }
                }
            },
            upsert=True
        )
```

## 3. MongoDB 操作[](#目录)

### 3.1 连接 MongoDB

使用 MongoDB Shell 或客户端工具连接 MongoDB 数据库。

```javascript
mongo --host localhost --port 27017
```

### 3.2 创建数据库和集合

#### 3.2.1 创建数据库

使用 `use` 命令创建数据库。

```javascript
use mydatabase
```

#### 3.2.2 创建集合[](#目录)

使用 `db.createCollection()` 方法创建集合。

```javascript
db.createCollection("mycollection")
```

### 3.3 插入文档

使用 `insertOne()` 或 `insertMany()` 方法插入文档。

```javascript
db.mycollection.insertOne({ name: "Alice", age: 30 })
db.mycollection.insertMany([
  { name: "Bob", age: 25 },
  { name: "Charlie", age: 35 }
])
```

### 3.4 查询文档[](#目录)

#### 3.4.1 基础查询操作

##### 精确匹配
```javascript
// 单个字段精确匹配
db.users.find({ age: 25 })

// 多个字段精确匹配
db.users.find({ age: 25, gender: "male" })

// 嵌套字段匹配
db.users.find({ "address.city": "Beijing" })
```

##### 比较操作符
```javascript
// 大于 $gt
db.users.find({ age: { $gt: 25 } })

// 大于等于 $gte
db.users.find({ age: { $gte: 25 } })

// 小于 $lt
db.users.find({ age: { $lt: 25 } })

// 小于等于 $lte
db.users.find({ age: { $lte: 25 } })

// 不等于 $ne
db.users.find({ age: { $ne: 25 } })

// 在指定范围内 $in
db.users.find({ age: { $in: [20, 25, 30] } })

// 不在指定范围内 $nin
db.users.find({ age: { $nin: [20, 25, 30] } })
```

##### 逻辑操作符
```javascript
// AND 操作
db.users.find({ $and: [
    { age: { $gt: 25 } },
    { gender: "male" }
] })

// OR 操作
db.users.find({ $or: [
    { age: { $lt: 20 } },
    { age: { $gt: 30 } }
] })

// NOT 操作
db.users.find({ age: { $not: { $gt: 25 } } })

// NOR 操作
db.users.find({ $nor: [
    { age: { $lt: 20 } },
    { gender: "female" }
] })
```

#### 3.4.2 高级查询操作[](#目录)

##### 数组查询
```javascript
// 数组包含元素
db.users.find({ hobbies: "reading" })

// 数组精确匹配
db.users.find({ hobbies: ["reading", "sports"] })

// 数组中任意元素匹配 $elemMatch
db.users.find({ scores: { $elemMatch: { $gt: 85 } } })

// 数组大小匹配 $size
db.users.find({ hobbies: { $size: 2 } })

// 数组索引匹配
db.users.find({ "hobbies.0": "reading" })
```

##### 正则表达式查询
```javascript
// 使用正则表达式
db.users.find({ name: /^A/ })  // 以A开头

// 使用 $regex 操作符
db.users.find({ name: { $regex: "^A", $options: "i" } })  // 不区分大小写
```

##### 存在性查询
```javascript
// 字段存在 $exists
db.users.find({ email: { $exists: true } })

// 字段不存在
db.users.find({ email: { $exists: false } })

// 字段值为null
db.users.find({ email: null })
```

#### 3.4.3 投影查询[](#目录)

##### 字段选择
```javascript
// 只返回特定字段
db.users.find({}, { name: 1, age: 1 })

// 排除特定字段
db.users.find({}, { password: 0, secret: 0 })

// 返回嵌套字段
db.users.find({}, { "address.city": 1 })
```

##### 数组切片
```javascript
// 使用 $slice 返回数组的一部分
db.users.find({}, { hobbies: { $slice: 2 } })  // 前两个元素
db.users.find({}, { hobbies: { $slice: -2 } }) // 后两个元素
db.users.find({}, { hobbies: { $slice: [1, 2] } }) // 从索引1开始的2个元素
```

#### 3.4.4 排序和分页[](#目录)
```javascript
// 单字段排序
db.users.find().sort({ age: 1 })  // 升序
db.users.find().sort({ age: -1 }) // 降序

// 多字段排序
db.users.find().sort({ age: -1, name: 1 })

// 分页查询
db.users.find().skip(10).limit(5)
```

### 3.5 更新文档

使用 `updateOne()` 或 `updateMany()` 方法更新文档。

```javascript
db.mycollection.updateOne({ name: "Alice" }, { $set: { age: 31 } })
db.mycollection.updateMany({ age: { $gt: 30 } }, { $set: { status: "active" } })
```

### 3.6 删除文档

使用 `deleteOne()` 或 `deleteMany()` 方法删除文档。

```javascript
db.mycollection.deleteOne({ name: "Alice" })
db.mycollection.deleteMany({ age: { $gt: 30 } })
```

## 4. MongoDB 高级操作[](#目录)

### 4.1 索引

#### 4.1.1 单字段索引
```javascript
// 创建升序索引
db.users.createIndex({ age: 1 })

// 创建降序索引
db.users.createIndex({ created_at: -1 })

// 创建唯一索引
db.users.createIndex({ email: 1 }, { unique: true })
```

#### 4.1.2 复合索引
```javascript
// 创建复合索引
db.users.createIndex({ age: 1, name: 1 })

// 创建带唯一约束的复合索引
db.users.createIndex(
    { email: 1, company_id: 1 },
    { unique: true }
)
```

#### 4.1.3 多键索引
```javascript
// 数组字段创建索引
db.products.createIndex({ tags: 1 })

// 嵌入文档数组字段创建索引
db.orders.createIndex({ "items.product_id": 1 })
```

#### 4.1.4 地理空间索引
```javascript
// 创建2d索引
db.places.createIndex({ location: "2d" })

// 创建2dsphere索引
db.places.createIndex({ location: "2dsphere" })

// 地理空间查询示例
db.places.find({
    location: {
        $near: {
            $geometry: {
                type: "Point",
                coordinates: [longitude, latitude]
            },
            $maxDistance: 5000 // 米
        }
    }
})
```

#### 4.1.5 文本索引[](#目录)
```javascript
// 创建文本索引
db.articles.createIndex({ title: "text", content: "text" })

// 文本搜索示例
db.articles.find({
    $text: {
        $search: "mongodb database",
        $caseSensitive: false,
        $diacriticSensitive: false
    }
})
```

#### 4.1.6 部分索引
```javascript
// 创建部分索引
db.orders.createIndex(
    { order_date: 1 },
    { 
        partialFilterExpression: {
            status: "active"
        }
    }
)
```

#### 4.1.7 索引属性
```javascript
// 创建带过期时间的索引
db.sessions.createIndex(
    { last_accessed: 1 },
    { expireAfterSeconds: 3600 }
)

// 创建隐藏索引
db.users.createIndex(
    { email: 1 },
    { hidden: true }
)

// 创建稀疏索引
db.users.createIndex(
    { email: 1 },
    { sparse: true }
)
```

#### 4.1.8 索引管理[](#目录)
```javascript
// 查看集合索引
db.users.getIndexes()

// 删除特定索引
db.users.dropIndex("index_name")

// 删除所有索引
db.users.dropIndexes()

// 重建索引
db.users.reIndex()
```

### 4.2 聚合框架[](#目录)

#### 4.2.1 基本聚合操作
```javascript
// 计数
db.users.count({ age: { $gt: 25 } })

// 去重
db.users.distinct("age")

// 分组统计
db.orders.aggregate([
    { $group: {
        _id: "$status",
        total: { $sum: "$amount" },
        count: { $sum: 1 }
    }}
])
```

#### 4.2.2 多阶段聚合
```javascript
// 复杂的聚合查询
db.orders.aggregate([
    { $match: { status: "completed" } },
    { $group: {
        _id: "$userId",
        totalAmount: { $sum: "$amount" },
        avgAmount: { $avg: "$amount" }
    }},
    { $sort: { totalAmount: -1 } },
    { $limit: 5 }
])
```

### 4.3 事务[](#目录)

#### 4.3.1 事务基础
```javascript
// 开启事务
const session = db.getMongo().startSession();
session.startTransaction();

try {
    // 执行事务操作
    const orders = session.getDatabase("mydb").getCollection("orders");
    const inventory = session.getDatabase("mydb").getCollection("inventory");
    
    // 创建订单
    orders.insertOne({
        _id: ObjectId(),
        item: "xyz",
        qty: 1,
        status: "pending"
    }, { session });
    
    // 更新库存
    inventory.updateOne(
        { item: "xyz" },
        { $inc: { qty: -1 } },
        { session }
    );
    
    // 提交事务
    session.commitTransaction();
} catch (error) {
    // 发生错误时回滚事务
    session.abortTransaction();
    throw error;
} finally {
    // 结束会话
    session.endSession();
}
```

#### 4.3.2 事务操作示例
```py3
// 转账事务示例
from pymongo import MongoClient
from pymongo.errors import PyMongoError
from bson.objectid import ObjectId
import datetime

client = MongoClient()
session = client.start_session()
session.start_transaction()

try:
    accounts = session.client.bank.accounts
    
    # 扣除转出账户金额
    from_account = accounts.update_one(
        {"_id": ObjectId(from_account_id), "balance": {"$gte": amount}},
        {"$inc": {"balance": -amount}},
        session=session
    )
    
    if from_account.modified_count != 1:
        raise Exception("Insufficient funds")
    
    # 增加转入账户金额
    to_account = accounts.update_one(
        {"_id": ObjectId(to_account_id)},
        {"$inc": {"balance": amount}},
        session=session
    )
    
    if to_account.modified_count != 1:
        raise Exception("Failed to transfer")
    
    # 记交易日志
    session.client.bank.transactions.insert_one({
        "from": from_account_id,
        "to": to_account_id,
        "amount": amount,
        "timestamp": datetime.datetime.now()
    }, session=session)
    
    session.commit_transaction()
except PyMongoError as error:
    session.abort_transaction()
    raise error
finally:
    session.end_session()
```

### 4.4 复制集[](#目录)

#### 4.4.1 复制集配置
```javascript
rs = db.getMongo().getDB("admin").getCollection("system.replset")
// 初始化复制集
rs.initiate({
    _id: "myReplicaSet",
    members: [
        { _id: 0, host: "mongodb1.example.net:27017" },
        { _id: 1, host: "mongodb2.example.net:27017" },
        { _id: 2, host: "mongodb3.example.net:27017" }
    ]
})

// 添加新节点
rs.add("mongodb4.example.net:27017")

// 添加仲裁节点
rs.addArb("mongodb5.example.net:27017")

// 删除节点
rs.remove("mongodb4.example.net:27017")
```

#### 4.4.2 复制集状态监控
```javascript
// 查看复制集状态
rs.status()

// 查看复制集配置
rs.conf()

// 查看主节点
db.isMaster()

// 查看复制延迟
rs.printSecondaryReplicationInfo()
```

### 4.5 分片[](#目录)

#### 4.5.1 分片集群配置
```javascript
// 启用分片
sh.enableSharding("mydb")

// 对集合进行分片
sh.shardCollection(
    "mydb.users",
    { "user_id": "hashed" }  // 哈希分片
)

// 范围分片示例
sh.shardCollection(
    "mydb.orders",
    { "order_date": 1 }  // 按日期范围分片
)

// 复合片键分片
sh.shardCollection(
    "mydb.products",
    { "category": 1, "price": 1 }
)
```

#### 4.5.2 分片管理
```javascript
// 查看分片状态
sh.status()

// 查看数据分布
db.users.getShardDistribution()

// 添加新分片
sh.addShard("mongodb6.example.net:27017")

// 移除分片
sh.removeShard("shard1")

// 均衡器配置
sh.setBalancerState(true)  // 启用均衡器
sh.getBalancerState()      // 查看均衡器状态
```

### 4.6 数据备份与恢复[](#目录)

#### 4.6.1 备份操作
```bash
# 全库备份
mongodump --host=mongodb1.example.net --port=27017 --out=/backup/full

# 指定数据库备份
mongodump --db=mydb --out=/backup/mydb

# 指定集合备份
mongodump --db=mydb --collection=users --out=/backup/users

# 带认证的备份
mongodump --username=admin --password=secret --authenticationDatabase=admin

# 压缩备份
mongodump --gzip --archive=backup.gz
```

#### 4.6.2 恢复操作
```bash
# 全库恢复
mongorestore --host=mongodb1.example.net --port=27017 /backup/full

# 指定数据库恢复
mongorestore --db=mydb /backup/mydb

# 指定集合恢复
mongorestore --db=mydb --collection=users /backup/users

# 从压缩文件恢复
mongorestore --gzip --archive=backup.gz
```

### 4.7 性能优化[](#目录)

#### 4.7.1 查询优化
```javascript
// 使用explain()分析查询
db.users.find({ age: { $gt: 25 } }).explain("executionStats")

// 创建合适的索引
db.users.createIndex({ age: 1, name: 1 })

// 使用投影减少返回字段
db.users.find({ age: { $gt: 25 } }, { name: 1, age: 1 })

// 使用限制减少返回数量
db.users.find().limit(100)
```

#### 4.7.2 写入优化
```javascript
// 批量写入
db.users.insertMany([
    { name: "user1" },
    { name: "user2" }
], { ordered: false })

// 批量更新
db.users.updateMany(
    { age: { $lt: 25 } },
    { $set: { status: "young" } }
)

// 使用upsert
db.users.updateOne(
    { email: "user@example.com" },
    { $set: { lastLogin: new Date() } },
    { upsert: true }
)
```

#### 4.7.3 索引优化
```javascript
// 创建覆盖查询的索引
db.users.createIndex({ age: 1, name: 1, _id: 0 })

// 创建支持排序的索引
db.users.createIndex({ age: 1, created_at: -1 })

// 删除未使用的索引
db.users.aggregate([
    { $indexStats: {} }
])
```

## 5. MongoDB 集群架构 [↑](#目录)

### 5.1 复制集架构 [↑](#目录)

#### 5.1.1 复制集概念 [↑](#目录)
```bash
# 复制集的基本组成
- Primary节点（主节点）
- Secondary节点（从节点）
- Arbiter节点（仲裁节点）

# 复制集的工作原理
- 数据同步机制
- 选举机制
- 故障转移机制
```

#### 5.1.2 复制集部署 [↑](#目录)
```bash
# 初始化复制集
rs.initiate({
    _id: "myReplicaSet",
    members: [
        { _id: 0, host: "mongodb1.example.net:27017", priority: 2 },
        { _id: 1, host: "mongodb2.example.net:27017", priority: 1 },
        { _id: 2, host: "mongodb3.example.net:27017", priority: 1 }
    ]
})

# 添加节点
rs.add("mongodb4.example.net:27017")

# 添加仲裁节点
rs.addArb("mongodb5.example.net:27017")
```

#### 5.1.3 复制集维护 [↑](#目录)
```bash
# 检查复制集状态
rs.status()

# 检查复制集配置
rs.conf()

# 复制集重配置
cfg = rs.conf()
cfg.members[0].priority = 2
rs.reconfig(cfg)

# 复制延迟检查
rs.printSlaveReplicationInfo()
```

### 5.2 分片集群架构 [↑](#目录)

#### 5.2.1 分片集群组件 [↑](#目录)
```bash
# 分片集群组件
- Config Server（配置服务器）
- Mongos（路由服务器）
- Shard（分片服务器）

# 分片策略
- 范围分片
- 哈希分片
```

#### 5.2.2 分片集群部署 [↑](#目录)
```bash
# 配置分片集群
sh.addShard("shard1/mongodb1.example.net:27017")
sh.addShard("shard2/mongodb2.example.net:27017")

# 启用数据库分片
sh.enableSharding("mydb")

# 对集合进行分片
sh.shardCollection("mydb.users", { "userId": "hashed" })
```

#### 5.2.3 分片集群维护 [↑](#目录)
```python
class ShardingMaintenance:
    def __init__(self, client):
        self.client = client
    
    def check_balancer_status(self):
        """检查均衡器状态"""
        config_db = self.client.admin
        balancer_status = config_db.command("balancerStatus")
        return balancer_status
    
    def manage_chunk_distribution(self):
        """管理数据块分布"""
        return {
            "chunks_per_shard": self.get_chunks_per_shard(),
            "data_distribution": self.get_data_distribution()
        }
    
    def monitor_migration(self):
        """监控迁移进度"""
        return self.client.admin.command("moveChunk", progress=True)
```

### 5.3 高可用配置 [↑](#目录)

#### 5.3.1 自动故障转移 [↑](#目录)
```python
class FailoverManager:
    def __init__(self, replica_set):
        self.replica_set = replica_set
    
    def monitor_health(self):
        """监控节点健康状态"""
        status = self.replica_set.status()
        return {
            "primary": self.get_primary_status(status),
            "secondaries": self.get_secondary_status(status)
        }
    
    def handle_failover(self):
        """处理故障转移"""
        # 实现故障转移逻辑
        pass
```

#### 5.3.2 读写分离 [↑](#目录)
```python
from pymongo.read_preferences import ReadPreference

class ReadWriteSeparation:
    def __init__(self, client):
        self.client = client
    
    def read_from_secondary(self, collection, query):
        """从从节点读取数据"""
        db = self.client.get_database(
            "mydb",
            read_preference=ReadPreference.SECONDARY
        )
        return db[collection].find(query)
    
    def write_to_primary(self, collection, document):
        """写入主节点"""
        return self.client.mydb[collection].insert_one(document)
```

### 5.4 集群监控 [↑](#目录)

#### 5.4.1 监控指标 [↑](#目录)
```python
class ClusterMonitor:
    def __init__(self, client):
        self.client = client
    
    def get_cluster_stats(self):
        """获取集群统计信息"""
        return {
            "sharding_stats": self.get_sharding_stats(),
            "replication_stats": self.get_replication_stats(),
            "performance_stats": self.get_performance_stats()
        }
    
    def get_sharding_stats(self):
        """获取分片统计信息"""
        return self.client.admin.command("serverStatus")["sharding"]
```

#### 5.4.2 监控工具 [↑](#目录)
```python
class MonitoringTools:
    def __init__(self):
        self.tools = {
            "mongodb_ops_manager": "企业级监控工具",
            "prometheus": "开源监控系统",
            "grafana": "可视化监控面板"
        }
    
    def setup_monitoring(self):
        """配置监控工具"""
        # 实现监控工具配置逻辑
        pass
```
## 6. MongoDB 安全[](#目录)

### 6.1 用户认证

#### 6.1.1 创建用户
```javascript
// 创建管理员用户
db.createUser({
    user: "admin",
    pwd: "secure_password",
    roles: [
        { role: "userAdminAnyDatabase", db: "admin" },
        { role: "readWriteAnyDatabase", db: "admin" }
    ]
})

// 创建数据库用户
db.createUser({
    user: "appUser",
    pwd: "app_password",
    roles: [
        { role: "readWrite", db: "mydb" },
        { role: "read", db: "reporting" }
    ]
})

// 创建只读用户
db.createUser({
    user: "reportUser",
    pwd: "report_password",
    roles: [
        { role: "read", db: "reporting" }
    ]
})
```

#### 6.1.2 用户管理
```javascript
// 查看用户信息
db.getUser("appUser")

// 查看所有用户
db.getUsers()

// 修改用户密码
db.changeUserPassword("appUser", "new_password")

// 更新用户角色
db.updateUser("appUser", {
    roles: [
        { role: "readWrite", db: "mydb" },
        { role: "readWrite", db: "newdb" }
    ]
})

// 删除用户
db.dropUser("appUser")
```

### 6.2 访问控制

#### 6.2.1 角色管理
```javascript
// 创建自定义角色
db.createRole({
    role: "myCustomRole",
    privileges: [
        {
            resource: { db: "mydb", collection: "users" },
            actions: [ "find", "update" ]
        }
    ],
    roles: [
        { role: "read", db: "reporting" }
    ]
})

// 查看角色权限
db.getRole("myCustomRole", { showPrivileges: true })

// 修改角色权限
db.updateRole("myCustomRole", {
    privileges: [
        {
            resource: { db: "mydb", collection: "users" },
            actions: [ "find", "update", "insert" ]
        }
    ]
})
```

#### 6.2.2 认证配置
```javascript
// 启用认证
mongod --auth

// 配置文件中启用认证
security:
    authorization: enabled
```

### 6.3 数据加密

#### 6.3.1 传输加密(TLS/SSL)
```javascript
// 启用SSL
mongod --sslMode requireSSL --sslPEMKeyFile server.pem

// 客户端SSL连接
mongo --ssl --sslCAFile ca.pem --host mongodb.example.com
```

#### 6.3.2 静态数据加密
```javascript
// 启用加密存储引擎
mongod --enableEncryption \
       --encryptionKeyFile /path/to/key \
       --encryptionCipherMode AES256-CBC
```

## 7. MongoDB 备份与恢复[](#目录)

### 7.1 备份策略

使用 `mongodump` 工具进行备份。

```bash
mongodump --db mydatabase --out /backup
```

### 7.2 恢复策略

使用 `mongorestore` 工具进行恢复。

```bash
mongorestore --db mydatabase /backup/mydatabase
```

## 8. MongoDB 监控与日志[](#目录)

### 8.1 监控工具

#### 8.1.1 数据库状态监控
```javascript
// 服务器状态
db.serverStatus()

// 数据库状态
db.stats()

// 集合状态
db.users.stats()

// 复制集状态
rs.status()
```

#### 8.1.2 性能监控
```javascript
// 当前操作
db.currentOp()

// 查看系统性能指标
db.serverStatus().metrics

// 查看连接信息
db.serverStatus().connections

// 查看内存使用
db.serverStatus().mem
```

#### 8.1.3 慢查询分析
```javascript
// 开启慢查询日志
db.setProfilingLevel(1, { slowms: 100 })

// 查看慢查询记录
db.system.profile.find().sort({ ts: -1 })

// 分析慢查询
db.system.profile.find({
    millis: { $gt: 100 }
}).sort({ millis: -1 })
```

### 8.2 日志管理

#### 8.2.1 日志配置
```javascript
// 设置日志级别
db.setLogLevel(1, "query")

// 配置文件中的日志设置
systemLog:
   destination: file
   path: "/var/log/mongodb/mongod.log"
   logAppend: true
   verbosity: 1
```

#### 8.2.2 日志分析
```javascript
// 查看最近的日志
db.adminCommand({ getLog: "global" })

// 分析错误日志
db.adminCommand({ getLog: "global" }).log.filter(
    line => line.includes("ERROR")
)

// 统计日志类型
db.adminCommand({ getLog: "global" }).log.reduce((acc, line) => {
    const type = line.split(" ")[1];
    acc[type] = (acc[type] || 0) + 1;
    return acc;
}, {})
```

## 9. MongoDB 客户端工具[](#目录)

### 9.1 MongoDB Shell

#### 9.1.1 基本操作
```javascript
// 连接数据库
mongo "mongodb://localhost:27017"

// 使用数据库
use mydb

// 执行JavaScript文件
load("script.js")
```

#### 9.1.2 自定义函数
```javascript
// 创建辅助函数
function findUsersByAge(age) {
    return db.users.find({ age: age }).toArray();
}

// 创建批处理函数
function batchUpdate(query, update, batchSize = 1000) {
    const total = db.users.count(query);
    for(let i = 0; i < total; i += batchSize) {
        db.users.updateMany(
            query,
            update,
            { skip: i, limit: batchSize }
        );
    }
}
```

### 9.2 MongoDB Compass

#### 9.2.1 查询构建器
```javascript
// 可视化查询条件
{
    age: { $gt: 25 },
    status: "active"
}

// 可视化聚合管道
[
    { $match: { status: "active" } },
    { $group: { _id: "$category", total: { $sum: 1 } }
]
```

#### 9.2.2 性能分析
```javascript
// 查询计划分析
db.users.find({
    age: { $gt: 25 }
}).explain("executionStats")

// 索引使用分析
db.users.aggregate([
    { $indexStats: {} }
])
```

### 9.3 Robo 3T (Studio 3T)

#### 9.3.1 可视化操作
- 数据库浏览器
- 集合查看器
- 查询编辑器
- 聚合管道构建器

#### 9.3.2 导入导出
- JSON/CSV导入导出
- MongoDB导入导出
- 数据迁移工具

## 10. MongoDB 实战案例[](#目录)

### 10.1 电商系统
```javascript
// 查询热销商品
db.products.find({
    stock: { $gt: 0 },
    sales: { $gt: 100 }
}).sort({ sales: -1 }).limit(10)

// 查询用户订单历史
db.orders.find({
    userId: ObjectId("user_id"),
    status: { $in: ["pending", "completed"] }
}).sort({ createTime: -1 })

// 统计商品分类销量
db.orders.aggregate([
    { $match: { status: "completed" } },
    { $unwind: "$items" },
    { $group: {
        _id: "$items.category",
        totalSales: { $sum: "$items.quantity" },
        revenue: { $sum: { $multiply: ["$items.price", "$items.quantity"] } }
    }},
    { $sort: { totalSales: -1 } }
])
```

### 10.2 社交网络
```javascript
// 查询用户好友
db.users.find({
    _id: { $in: db.friendships.find(
        { userId: ObjectId("user_id") }
    ).map(f => f.friendId) }
})

// 查询热门帖子
db.posts.find({
    createTime: { $gt: new Date(Date.now() - 24*60*60*1000) },
    likes: { $gt: 100 }
}).sort({ likes: -1 })

// 统计用户互动
db.interactions.aggregate([
    { $match: { userId: ObjectId("user_id") } },
    { $group: {
        _id: "$type",
        count: { $sum: 1 },
        lastInteraction: { $max: "$createTime" }
    }}
])
```

### 10.3 日志分析
```javascript
// 查询错误日志
db.logs.find({
    level: "ERROR",
    timestamp: {
        $gte: ISODate("2024-01-01"),
        $lt: ISODate("2024-01-02")
    }
})

// 统计接口调用
db.logs.aggregate([
    { $match: { type: "API_CALL" } },
    { $group: {
        _id: "$endpoint",
        totalCalls: { $sum: 1 },
        avgResponseTime: { $avg: "$responseTime" },
        errors: {
            $sum: { $cond: [{ $eq: ["$status", "ERROR"] }, 1, 0] }
        }
    }},
    { $sort: { totalCalls: -1 } }
])
```

### 10.4 内容管理系统(CMS)
```javascript
// 文章集合设计
{
    _id: ObjectId("..."),
    title: "MongoDB Best Practices",
    slug: "mongodb-best-practices",
    content: "...",
    author: {
        _id: ObjectId("..."),
        name: "John Doe",
        email: "john@example.com"
    },
    categories: ["Database", "NoSQL"],
    tags: ["MongoDB", "Database", "Tutorial"],
    status: "published",
    featured_image: "path/to/image.jpg",
    comments: [
        {
            user_id: ObjectId("..."),
            content: "Great article!",
            created_at: ISODate("...")
        }
    ],
    meta: {
        views: 1200,
        likes: 45,
        shares: 30
    },
    created_at: ISODate("..."),
    updated_at: ISODate("...")
}

// 热门文章查询
db.articles.find({
    status: "published",
    created_at: {
        $gte: new Date(Date.now() - 7*24*60*60*1000)
    }
}).sort({
    "meta.views": -1,
    "meta.likes": -1
}).limit(10)

// 相关文章推荐
db.articles.aggregate([
    { $match: {
        categories: { $in: currentArticle.categories },
        _id: { $ne: currentArticle._id },
        status: "published"
    }},
    { $addFields: {
        commonCategories: {
            $size: {
                $setIntersection: ["$categories", currentArticle.categories]
            }
        },
        commonTags: {
            $size: {
                $setIntersection: ["$tags", currentArticle.tags]
            }
        }
    }},
    { $sort: {
        commonCategories: -1,
        commonTags: -1,
        "meta.views": -1
    }},
    { $limit: 5 }
])
```

### 10.5 实时分析系统
```javascript
// 用户行为事件集合
{
    _id: ObjectId("..."),
    user_id: ObjectId("..."),
    event_type: "page_view",
    page: "/products/123",
    source: "mobile_app",
    session_id: "sess_123",
    timestamp: ISODate("..."),
    metadata: {
        device: "iPhone",
        os: "iOS 15.0",
        location: {
            country: "US",
            city: "New York"
        }
    }
}

// 实时统计在线用户
db.events.aggregate([
    { $match: {
        timestamp: {
            $gte: new Date(Date.now() - 5*60*1000) // 最近5分钟
        }
    }},
    { $group: {
        _id: "$session_id",
        last_activity: { $max: "$timestamp" }
    }},
    { $count: "active_users" }
])

// 实时热门页面分析
db.events.aggregate([
    { $match: {
        event_type: "page_view",
        timestamp: {
            $gte: new Date(Date.now() - 15*60*1000) // 最近15分钟
        }
    }},
    { $group: {
        _id: "$page",
        views: { $sum: 1 },
        unique_users: { $addToSet: "$user_id" }
    }},
    { $addFields: {
        unique_views: { $size: "$unique_users" }
    }},
    { $sort: { views: -1 } },
    { $limit: 10 }
])
```

### 10.6 物联网数据存储
```javascript
// 设备数据集合
{
    _id: ObjectId("..."),
    device_id: "device_123",
    type: "temperature_sensor",
    location: {
        type: "Point",
        coordinates: [longitude, latitude]
    },
    readings: [
        {
            timestamp: ISODate("..."),
            temperature: 25.6,
            humidity: 60,
            battery: 85
        }
    ],
    status: "active",
    last_maintenance: ISODate("..."),
    firmware_version: "1.2.3"
}

// 时序数据查询
db.devices.aggregate([
    { $match: {
        device_id: "device_123",
        "readings.timestamp": {
            $gte: ISODate("2024-01-01"),
            $lt: ISODate("2024-01-02")
        }
    }},
    { $unwind: "$readings" },
    { $match: {
        "readings.timestamp": {
            $gte: ISODate("2024-01-01"),
            $lt: ISODate("2024-01-02")
        }
    }},
    { $group: {
        _id: {
            $hour: "$readings.timestamp"
        },
        avg_temperature: { $avg: "$readings.temperature" },
        min_temperature: { $min: "$readings.temperature" },
        max_temperature: { $max: "$readings.temperature" }
    }},
    { $sort: { _id: 1 } }
])

// 异常检测
db.devices.find({
    "readings.temperature": { $gt: 30 },
    status: "active"
})
```

## 11. MongoDB 最佳实践[](#目录)

### 11.1 数据模型设计最佳实践

#### 11.1.1 模式设计原则
```javascript
// 1. 嵌入式vs引用式
// 嵌入式示例 - 适用于一对一或一对少量多
{
    _id: ObjectId("..."),
    user_info: {
        name: "John",
        email: "john@example.com",
        address: {
            street: "123 Main St",
            city: "New York"
        }
    }
}

// 引用式示例 - 适用于一对多或多对多
{
    _id: ObjectId("..."),
    user_id: ObjectId("..."),
    order_items: [
        { product_id: ObjectId("..."), quantity: 2 },
        { product_id: ObjectId("..."), quantity: 1 }
    ]
}

// 2. 避免过深嵌套
// 不推荐
{
    level1: {
        level2: {
            level3: {
                level4: {
                    data: "too deep"
                }
            }
        }
    }
}

// 3. 合理使用数组
// 限制数组大小
{
    comments: {
        $slice: -100  // 只保留最近100条评论
    }
}
```

#### 11.1.2 索引设计原则
```javascript
// 1. 支持查询模式
// 常用查询字段创建索引
db.users.createIndex({ email: 1, status: 1 })

// 2. 复合索引顺序
// 基于基数排序
db.users.createIndex({ status: 1, email: 1 }) // status基数低，email基数高

// 3. 覆盖索引
db.users.find(
    { age: { $gt: 25 } },
    { name: 1, age: 1, _id: 0 }
).hint({ age: 1, name: 1 })
```

### 11.2 性能优化最佳实践

#### 11.2.1 查询优化
```javascript
// 1. 使用投影
db.users.find(
    { age: { $gt: 25 } },
    { name: 1, email: 1 }
)

// 2. 批量操作
db.users.bulkWrite([
    { insertOne: { document: { name: "user1" } } },
    { updateOne: {
        filter: { name: "user2" },
        update: { $set: { status: "active" } }
    }}
])

// 3. 使用适当的分页大小
db.users.find().skip(1000).limit(10) // 避免大的skip值
```

#### 11.2.2 写入优化
```javascript
// 1. 批量插入
db.users.insertMany([
    { name: "user1" },
    { name: "user2" }
], { ordered: false })

// 2. 使用upsert
db.users.updateOne(
    { email: "user@example.com" },
    { $set: { lastLogin: new Date() } },
    { upsert: true }
)
```

### 11.3 运维最佳实践

#### 11.3.1 监控和告警
```javascript
// 1. 设置监控阈值
{
    "operationTime": {
        threshold: 100,
        action: "alert"
    },
    "connections": {
        current: { max: 5000 },
        available: { min: 1000 }
    }
}

// 2. 性能基准测试
for (i = 0; i < 1000; i++) {
    db.users.find({ age: { $gt: 25 } }).explain("executionStats")
}
```

#### 11.3.2 备份策略
```javascript
// 1. 定时备份脚本
const backupScript = `
mongodump \
    --host=mongodb1.example.net \
    --port=27017 \
    --out=/backup/$(date +%Y%m%d) \
    --gzip
`

// 2. 备份验证
const verifyBackup = `
mongorestore \
    --host=mongodb2.example.net \
    --port=27017 \
    --dir=/backup/latest \
    --dryRun
`
```

## 12. MongoDB 高级特性[](#目录)

### 12.1 Change Streams
```javascript
// 监听集合变更
const changeStream = db.collection('users').watch([
    { $match: {
        'operationType': { $in: ['insert', 'update', 'delete'] }
    }}
]);

changeStream.on('change', (change) => {
    console.log('检测到变更:', change);
    
    switch(change.operationType) {
        case 'insert':
            handleInsert(change.fullDocument);
            break;
        case 'update':
            handleUpdate(change.documentKey, change.updateDescription);
            break;
        case 'delete':
            handleDelete(change.documentKey);
            break;
    }
});

// 带恢复功能的变更流
const resumeToken = await getStoredResumeToken();
const changeStream = collection.watch([], {
    resumeAfter: resumeToken,
    fullDocument: 'updateLookup'
});
```

### 12.2 GridFS 大文件存储
```javascript
// 存储文件
const bucket = new GridFSBucket(db, {
    bucketName: 'files'
});

// 上传文件
const uploadStream = bucket.openUploadStream('example.pdf', {
    metadata: {
        type: 'document',
        uploadDate: new Date(),
        owner: 'user123'
    }
});

fs.createReadStream('path/to/example.pdf').pipe(uploadStream);

// 下载文件
const downloadStream = bucket.openDownloadStreamByName('example.pdf');
downloadStream.pipe(fs.createWriteStream('downloaded.pdf'));

// 查找文件
const files = await bucket.find({
    'metadata.type': 'document'
}).toArray();
```

### 12.3 地理空间查询
```javascript
// 创建2dsphere索引
db.locations.createIndex({ location: "2dsphere" });

// 存储地理位置数据
db.locations.insertOne({
    name: "Central Park",
    location: {
        type: "Point",
        coordinates: [-73.97, 40.77]
    },
    category: "park"
});

// 查找附近的位置
db.locations.find({
    location: {
        $near: {
            $geometry: {
                type: "Point",
                coordinates: [-73.97, 40.77]
            },
            $maxDistance: 1000,  // 米
            $minDistance: 100
        }
    }
});

// 地理围栏查询
db.locations.find({
    location: {
        $geoWithin: {
            $geometry: {
                type: "Polygon",
                coordinates: [[
                    [-74.0, 40.7],
                    [-73.9, 40.7],
                    [-73.9, 40.8],
                    [-74.0, 40.8],
                    [-74.0, 40.7]
                ]]
            }
        }
    }
});
```

### 12.4 全文搜索
```javascript
// 创建文本索引
db.articles.createIndex({
    title: "text",
    content: "text",
    tags: "text"
}, {
    weights: {
        title: 10,
        content: 5,
        tags: 2
    },
    default_language: "english"
});

// 基本文本搜索
db.articles.find({
    $text: {
        $search: "mongodb database",
        $caseSensitive: false,
        $diacriticSensitive: false
    }
});

// 带评分的文本搜索
db.articles.aggregate([
    { $match: {
        $text: { $search: "mongodb database" }
    }},
    { $addFields: {
        score: { $meta: "textScore" }
    }},
    { $sort: {
        score: { $meta: "textScore" }
    }}
]);
```

### 12.5 数据加密
```javascript
// 客户端字段级加密
const clientEncryption = new ClientEncryption(client, {
    keyVaultNamespace: 'encryption.__keyVault',
    kmsProviders: {
        local: {
            key: localMasterKey
        }
    }
});

// 创建加密字段
const encrypted = await clientEncryption.encrypt(
    sensitiveData,
    {
        algorithm: 'AEAD_AES_256_CBC_HMAC_SHA_512_Deterministic',
        keyAltName: 'myDataKey'
    }
);

// 自动解密
const result = await collection.findOne({
    ssn: encrypted
});
```

## 13. MongoDB 性能调优进阶[](#目录)

### 13.1 查询优化进阶
```javascript
// 使用投影优化内存使用
db.users.find(
    { age: { $gt: 25 } },
    { name: 1, email: 1, _id: 0 }
).explain('executionStats')

// 复合索引优化
db.users.createIndex(
    { age: 1, name: 1, email: 1 },
    { partialFilterExpression: { status: 'active' } }
)

// 避免在大数据集上使用skip
function* paginate(query, pageSize) {
    let lastId = null;
    while (true) {
        const filter = lastId 
            ? { ...query, _id: { $gt: lastId } }
            : query;
            
        const batch = await collection
            .find(filter)
            .limit(pageSize)
            .toArray();
            
        if (batch.length === 0) break;
        
        yield batch;
        lastId = batch[batch.length - 1]._id;
    }
}
```

### 13.2 聚合管道优化
```javascript
// 使用 $match 早期过滤
db.orders.aggregate([
    { $match: { status: 'completed' } },  // 早期过滤
    { $group: {
        _id: '$userId',
        totalAmount: { $sum: '$amount' }
    }},
    { $sort: { totalAmount: -1 } }
]);

// 使用 $project 减少数据传输
db.orders.aggregate([
    { $match: { status: 'completed' } },
    { $project: {
        userId: 1,
        amount: 1,
        _id: 0
    }},
    { $group: {
        _id: '$userId',
        totalAmount: { $sum: '$amount' }
    }}
]);

// 使用 allowDiskUse 处理大数据集
db.orders.aggregate([
    // 聚合管道
], {
    allowDiskUse: true
});
```

### 13.3 写入性能优化
```javascript
// 批量写入优化
const operations = documents.map(doc => ({
    insertOne: { document: doc }
}));

const batchSize = 1000;
for (let i = 0; i < operations.length; i += batchSize) {
    const batch = operations.slice(i, i + batchSize);
    await collection.bulkWrite(batch, {
        ordered: false,
        writeConcern: { w: 1 }
    });
}

// 索引构建优化
db.users.createIndex(
    { email: 1 },
    { background: true }
);

// 使用 writeConcern 优化写入确认
db.users.insertMany(
    documents,
    { writeConcern: { w: 1, j: false } }
);
```

### 13.4 内存优化
```javascript
// 监控内存使用
db.serverStatus().mem

// 限制查询结果集大小
db.users.find().maxTimeMS(5000).max(1000)

// 使用投影减少内存使用
db.orders.aggregate([
    { $project: {
        _id: 0,
        total: { $multiply: ['$quantity', '$price'] }
    }}
], {
    allowDiskUse: true
});
```

## 14. MongoDB 故障排查指南[](#目录)

### 14.1 常见问题诊断

#### 14.1.1 连接问题
```python
from pymongo import MongoClient
from pymongo.errors import ConnectionFailure
import logging

class MongoDBConnector:
    def __init__(self, uri="mongodb://localhost:27017/"):
        self.client = MongoClient(uri)
        
    def check_connection(self):
        try:
            # 检查连接状态
            self.client.admin.command('ismaster')
            return True
        except ConnectionFailure as e:
            logging.error(f"连接失败: {e}")
            return False
            
    def get_connection_status(self):
        try:
            # 获取连接信息
            server_status = self.client.admin.command('serverStatus')
            return {
                'current_connections': server_status['connections']['current'],
                'available_connections': server_status['connections']['available']
            }
        except Exception as e:
            logging.error(f"获取连接状态失败: {e}")
            return None
```

#### 14.1.2 性能问题
```python
from datetime import datetime, timedelta

class PerformanceAnalyzer:
    def __init__(self, db):
        self.db = db
        
    def analyze_slow_queries(self, threshold_ms=100):
        """分析慢查询"""
        self.db.command({'profile': 1, 'slowms': threshold_ms})
        
        slow_queries = self.db.system.profile.find({
            'millis': {'$gt': threshold_ms}
        }).sort('millis', -1)
        
        return list(slow_queries)
        
    def analyze_query_plan(self, collection, query):
        """分析查询计划"""
        return collection.find(query).explain('executionStats')
        
    def get_index_stats(self, collection):
        """获取索引使用统计"""
        return list(collection.aggregate([
            {'$indexStats': {}}
        ]))
```

#### 14.1.3 内存问题
```python
class MemoryAnalyzer:
    def __init__(self, db):
        self.db = db
        
    def check_memory_health(self):
        """检查内存健康状态"""
        stats = self.db.command('serverStatus')
        mem_info = {
            'virtual': stats['mem']['virtual'],
            'resident': stats['mem']['resident'],
            'mapped': stats['mem'].get('mapped', 0),
            'cache_dirty': stats['wiredTiger']['cache']['tracked dirty bytes in the cache'],
            'cache_used': stats['wiredTiger']['cache']['bytes currently in the cache']
        }
        
        warnings = []
        if mem_info['resident'] > 1024 * 1024 * 1024:  # 1GB
            warnings.append("内存使用超过限制")
        if mem_info['cache_dirty'] / mem_info['cache_used'] > 0.5:
            warnings.append("脏页比例过高")
            
        return {
            'status': 'healthy' if not warnings else 'warning',
            'warnings': warnings,
            'mem_info': mem_info
        }
```

### 14.2 故障排查工具

#### 14.2.1 日志分析
```python
from datetime import datetime, timedelta
import re

class LogAnalyzer:
    def __init__(self, db):
        self.db = db
        
    def analyze_error_logs(self, hours=24):
        """分析错误日志"""
        cutoff_date = datetime.now() - timedelta(hours=hours)
        
        logs = self.db.command('getLog', 'global')['log']
        error_logs = []
        
        for line in logs:
            if 'ERROR' in line:
                timestamp_str = line.split('|')[0].strip()
                try:
                    timestamp = datetime.strptime(timestamp_str, '%Y-%m-%d %H:%M:%S')
                    if timestamp > cutoff_date:
                        parts = line.split('|')
                        error_logs.append({
                            'timestamp': timestamp,
                            'severity': parts[1].strip(),
                            'component': parts[2].strip(),
                            'message': parts[3].strip()
                        })
                except (ValueError, IndexError):
                    continue
                    
        return error_logs
        
    def get_log_stats(self, hours=24):
        """获取日志统计"""
        logs = self.analyze_error_logs(hours)
        
        stats = {
            'total_errors': len(logs),
            'by_component': {},
            'by_hour': {}
        }
        
        for log in logs:
            # 按组件统计
            component = log['component']
            stats['by_component'][component] = stats['by_component'].get(component, 0) + 1
            
            # 按小时统计
            hour = log['timestamp'].hour
            stats['by_hour'][hour] = stats['by_hour'].get(hour, 0) + 1
            
        return stats
```

#### 14.2.2 性能诊断工具
```python
class QueryAnalyzer:
    def __init__(self, collection):
        self.collection = collection
        
    def analyze_query_pattern(self, query):
        """分析查询模式"""
        return {
            'has_indexes': self._check_indexes(query),
            'scan_type': self._get_scan_type(query),
            'potential_issues': self._identify_issues(query)
        }
        
    def _check_indexes(self, query):
        """检查索引使用情况"""
        explain = self.collection.find(query).explain()
        stages = explain['queryPlanner']['winningPlan']['inputStage']
        
        return {
            'used_index': stages.get('indexName'),
            'is_ideal_index': stages['stage'] != 'COLLSCAN'
        }
        
    def _get_scan_type(self, query):
        """获取扫描类型"""
        explain = self.collection.find(query).explain()
        return explain['queryPlanner']['winningPlan']['inputStage']['stage']
        
    def _identify_issues(self, query):
        """识别潜在问题"""
        explain = self.collection.find(query).explain('executionStats')
        stats = explain['executionStats']
        issues = []
        
        if stats['totalDocsExamined'] > stats['nReturned'] * 10:
            issues.append("扫描文档数过多")
            
        if stats['executionTimeMillis'] > 100:
            issues.append("查询执行时间过长")
            
        return issues
```

### 14.3 使用示例
```python
# 使用示例
if __name__ == "__main__":
    # 连接MongoDB
    client = MongoClient("mongodb://localhost:27017/")
    db = client['test_db']
    
    # 创建分析器实例
    connector = MongoDBConnector()
    perf_analyzer = PerformanceAnalyzer(db)
    mem_analyzer = MemoryAnalyzer(db)
    log_analyzer = LogAnalyzer(db)
    query_analyzer = QueryAnalyzer(db.users)
    
    # 检查连接状态
    if connector.check_connection():
        print("MongoDB连接正常")
        
        # 分析慢查询
        slow_queries = perf_analyzer.analyze_slow_queries()
        print(f"发现 {len(slow_queries)} 个慢查询")
        
        # 检查内存状态
        mem_health = mem_analyzer.check_memory_health()
        print(f"内存状态: {mem_health['status']}")
        
        # 分析错误日志
        error_stats = log_analyzer.get_log_stats()
        print(f"过去24小时发现 {error_stats['total_errors']} 个错误")
        
        # 分析查询模式
        query_pattern = query_analyzer.analyze_query_pattern({'age': {'$gt': 25}})
        print(f"查询分析结果: {query_pattern}")
```

### 14.4 故障恢复策略

#### 14.4.1 数据恢复
```python
# 1. 数据损坏修复
db.repairDatabase()

# 2. 索引重建
async function rebuildIndexes(collection) {
    const indexes = await collection.indexes();
    
    for (const index of indexes) {
        if (index.name === '_id_') continue;
        
        try {
            await collection.dropIndex(index.name);
            await collection.createIndex(
                index.key,
                {
                    name: index.name,
                    background: true,
                    ...index
                }
            );
            console.log(`重建索引成功: ${index.name}`);
        } catch (error) {
            console.error(`重建索引失败: ${index.name}`, error);
        }
    }
}

# 3. 数据一致性检查
async function checkDataConsistency(collection) {
    const inconsistencies = [];
    
    # 检查必填字段
    const docs = await collection.find({
        $or: [
            { requiredField1: { $exists: false } },
            { requiredField2: { $exists: false } }
        ]
    }).toArray();
    
    if (docs.length > 0) {
        inconsistencies.push({
            type: "missing_required_fields",
            count: docs.length,
            examples: docs.slice(0, 5)
        });
    }
    
    # 检查数据类型
    const invalidTypes = await collection.find({
        $or: [
            { numericField: { $not: { $type: "number" } } },
            { dateField: { $not: { $type: "date" } } }
        ]
    }).toArray();
    
    if (invalidTypes.length > 0) {
        inconsistencies.push({
            type: "invalid_data_types",
            count: invalidTypes.length,
            examples: invalidTypes.slice(0, 5)
        });
    }
    
    return inconsistencies;
}
```

#### 14.4.2 服务恢复
```python
# 1. 复制集故障转移检查
function checkReplicaSetHealth() {
    const status = rs.status();
    const config = rs.conf();
    
    return {
        # 检查节点状态
        nodes: status.members.map(member => ({
            host: member.name,
            state: member.stateStr,
            health: member.health,
            lastHeartbeat: member.lastHeartbeat,
            syncingTo: member.syncingTo
        })),
        
        # 检查选举状态
        election: {
            primaryNode: status.members.find(m => m.state === 1)?.name,
            electionTime: status.date,
            term: status.term
        },
        
        # 检查同步状态
        replication: {
            syncLag: status.members
                .filter(m => m.state === 2)
                .map(m => ({
                    host: m.name,
                    lag: m.optimeDate
                }))
        }
    };
}

# 2. 自动故障恢复脚本
async function autoRecovery() {
    const health = checkReplicaSetHealth();
    
    # 处理节点故障
    for (const node of health.nodes) {
        if (!node.health) {
            console.log(`检测到节点故障: ${node.host}`);
            
            try {
                # 尝试重启节点
                await restartMongoNode(node.host);
                
                # 检查节点恢复状态
                await waitForNodeRecovery(node.host);
                
                console.log(`节点已恢复: ${node.host}`);
            } catch (error) {
                console.error(`节点恢复失败: ${node.host}`, error);
                # 发送告警
                sendAlert({
                    type: 'NODE_RECOVERY_FAILED',
                    node: node.host,
                    error: error.message
                });
            }
        }
    }
}
```

### 14.4 预防性维护

#### 14.4.1 健康检查
```python
# 1. 系统健康检查
const healthCheck = {
    # 检查数据库状态
    checkDbStatus: function() {
        return db.adminCommand({ serverStatus: 1 });
    },
    
    # 检查复制集状态
    checkReplicaSetStatus: function() {
        return rs.status();
    },
    
    # 检查分片状态
    checkShardingStatus: function() {
        return sh.status();
    },
    
    # 综合健康检查
    runFullHealthCheck: function() {
        return {
            dbStatus: this.checkDbStatus(),
            replicaStatus: this.checkReplicaSetStatus(),
            shardStatus: this.checkShardingStatus(),
            timestamp: new Date()
        };
    }
};

# 2. 定期健康检查任务
function scheduleHealthChecks(intervalMinutes = 5) {
    const checks = [];
    
    setInterval(() => {
        try {
            const health = healthCheck.runFullHealthCheck();
            checks.push(health);
            
            # 保留最近24小时的检查记录
            if (checks.length > (24 * 60 / intervalMinutes)) {
                checks.shift();
            }
            
            # 分析健康趋势
            analyzeTrends(checks);
            
        } catch (error) {
            console.error('健康检查失败:', error);
            sendAlert({
                type: 'HEALTH_CHECK_FAILED',
                error: error.message
            });
        }
    }, intervalMinutes * 60 * 1000);
}
```

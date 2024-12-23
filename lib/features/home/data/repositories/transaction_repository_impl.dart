import 'dart:developer';

import 'package:finmanageapp/core/api/api_collections.dart';
import 'package:finmanageapp/core/util/enums.dart';
import 'package:finmanageapp/core/util/params/category_params.dart';
import 'package:finmanageapp/core/util/params/description_params.dart';
import 'package:finmanageapp/core/util/params/transaction_params.dart';
import 'package:finmanageapp/features/auth/domain/repository/auth_repository.dart';
import 'package:finmanageapp/features/home/data/models/total_stats_model.dart';
import 'package:finmanageapp/features/home/data/models/transaction_model.dart';
import 'package:finmanageapp/features/home/domain/entities/transaction_entity.dart';
import 'package:finmanageapp/features/home/domain/repositories/category_repository.dart';
import 'package:finmanageapp/features/home/domain/repositories/description_repository.dart';
import 'package:finmanageapp/features/home/domain/repositories/transaction_repository.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final _collection = ApiCollections.transactions;
  final AuthRepository _authRepository;
  final CategoryRepository _categoryRepository;
  final DescriptionRepository _descriptionRepository;

  TransactionRepositoryImpl(this._authRepository, this._categoryRepository,
      this._descriptionRepository);

  @override
  Future<List<TransactionModel>> fetchLastTen({void params}) async {
    try {
      final transactions = <TransactionModel>[];
      final userId = (await _authRepository.user.first)!.id;

      final snapshot = await _collection
          .limit(10)
          .where('userId', isEqualTo: userId)
          .orderBy('date', descending: true)
          .get();

      if (snapshot.docs.isNotEmpty) {
        for (final doc in snapshot.docs) {
          final entity = TransactionEntity.fromDocument(doc);
          transactions.add(TransactionModel.fromEntity(entity));
        }
      }

      for (final transaction in transactions) {
        transaction.description = await _descriptionRepository
            .fetchNameById(transaction.descriptionId);
        transaction.category =
            await _categoryRepository.fetchNameById(transaction.categoryId);
      }

      return transactions;
    } catch (e, stackTrace) {
      log(e.toString(), stackTrace: stackTrace);
      rethrow;
    }
  }

  @override
  Future<TotalStatsModel> fetchTotalStats({void params}) async {
    try {
      final transactions = <TransactionModel>[];
      final userId = (await _authRepository.user.first)!.id;

      final snapshot =
          await _collection.where('userId', isEqualTo: userId).get();

      if (snapshot.docs.isNotEmpty) {
        for (final doc in snapshot.docs) {
          final entity = TransactionEntity.fromDocument(doc);
          transactions.add(TransactionModel.fromEntity(entity));
        }
      }

      int totalIncomes = 0, totalExpenses = 0;

      for (final transaction in transactions) {
        if (transaction.type == TransactionType.expense) {
          totalExpenses += transaction.value;
        } else if (transaction.type == TransactionType.income) {
          totalIncomes += transaction.value;
        }
      }

      final totalBalance = totalIncomes - totalExpenses;

      return TotalStatsModel(
          totalBalance: totalBalance,
          totalIncomes: totalIncomes,
          totalExpenses: totalExpenses);
    } catch (e, stackTrace) {
      log(e.toString(), stackTrace: stackTrace);
      rethrow;
    }
  }

  @override
  Future<TransactionModel> register(
      {required CreateTransactionParams params}) async {
    try {
      final userId = (await _authRepository.user.first)!.id;
      final categoryId = await _categoryId(params: params);
      final descriptionId = await _descriptionId(params: params);

      final entity = TransactionEntity(
          userId: userId,
          categoryId: categoryId,
          descriptionId: descriptionId,
          value: params.value,
          date: params.date,
          type: params.type!);

      final docRef = await _collection.add(entity.toJson());

      return TransactionModel.fromEntity(entity..id = docRef.id);
    } catch (e, stackTrace) {
      log(e.toString(), stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<String> _categoryId({required CreateTransactionParams params}) async {
    return await _categoryRepository.register(
        params: CreateCategoryParams(
            category: params.category, type: params.type!));
  }

  Future<String> _descriptionId(
      {required CreateTransactionParams params}) async {
    return await _descriptionRepository.register(
        params: CreateDescriptionParams(
            description: params.description, type: params.type!));
  }
}

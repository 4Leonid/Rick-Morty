//
//  CharacterStorage.swift
//  Rick&Morty
//
//  Created by Леонид Турко on 10.12.2024.
//

import Foundation
import CoreData

struct CharacterStorage {
    static let shared = CharacterStorage()

    private let context = CoreDataStack.shared.context

    // Сохранение объекта
    func save(character: Character) {
        let entity = CharacterEntity(context: context)
        entity.id = Int64(character.id)
        entity.name = character.name
        entity.image = character.image

        do {
            try context.save()
        } catch {
            print("Failed to save character: \(error.localizedDescription)")
        }
    }

    // Удаление объекта
    func delete(characterID: Int) {
        let fetchRequest: NSFetchRequest<CharacterEntity> = CharacterEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %d", characterID)

        do {
            let results = try context.fetch(fetchRequest)
            for object in results {
                context.delete(object)
            }
            try context.save()
        } catch {
            print("Failed to delete character: \(error.localizedDescription)")
        }
    }

    // Получение всех сохранённых объектов
    func fetchAllCharacters() -> [CharacterEntity] {
        let fetchRequest: NSFetchRequest<CharacterEntity> = CharacterEntity.fetchRequest()
        do {
            return try context.fetch(fetchRequest)
        } catch {
            print("Failed to fetch characters: \(error.localizedDescription)")
            return []
        }
    }
    
    // Проверка существования объекта в базе данных
       func isCharacterExists(characterID: Int) -> Bool {
           let fetchRequest: NSFetchRequest<CharacterEntity> = CharacterEntity.fetchRequest()
           fetchRequest.predicate = NSPredicate(format: "id == %d", characterID)
           fetchRequest.fetchLimit = 1

           do {
               let count = try context.count(for: fetchRequest)
               return count > 0
           } catch {
               print("Failed to check if character exists: \(error.localizedDescription)")
               return false
           }
       }
}

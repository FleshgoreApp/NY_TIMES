//
//  CoreData.swift
//  NY_TIMES
//
//  Created by Saul Goodman on 30.07.2020.
//  Copyright © 2020 Shvets. All rights reserved.
//

import Foundation
import CoreData

enum CoreDataError: Error {
    case addToFavoritesFailure
    case suchRecordExists
}

extension CoreDataError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .addToFavoritesFailure:
            return NSLocalizedString("An error occurred while adding news to the database", comment: "")
        case .suchRecordExists:
            return NSLocalizedString("Such record already exists in the database", comment: "")
        }
    }
}

protocol DatabaseProtocol: class {
    func isFavoritesNews(_ newsID: Int) -> Bool
    func addNews(news: News, completion: @escaping (_ success: Bool, _ error: Error?) -> Void)
    func getNews(completion:@escaping (_ news: [News]?) -> Void)
    func deleteNews(news: [News], completion: @escaping (Bool) -> Void)
}

final class CoreData: DatabaseProtocol {
    static let shared = CoreData()
    fileprivate init() {
        self.MOC = self.persistentContainer.viewContext
    }
    
    typealias AddNewsHandler = (_ success: Bool, _ error: Error?) -> Void
    typealias GetNewsHandler = (_ news: [News]?) -> Void
    typealias SuccessHandler = (_ success: Bool) -> Void
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: CoreDataConstants.kDBName)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    private var MOC:NSManagedObjectContext!
    private var entityName = CoreDataConstants.kNewsEntityName
    
    // MARK: - Open
    func addNews(news: News, completion: @escaping AddNewsHandler) {
        let check = checkClone(id: news.id ?? 0)
        guard check else {
            completion(false, CoreDataError.suchRecordExists)
            return
        }
        
        let container = self.persistentContainer
        container.performBackgroundTask { (context) in
            guard let entity = NSEntityDescription.entity(forEntityName: self.entityName, in: context) else {
                completion(false, CoreDataError.addToFavoritesFailure)
                return
            }
            
            let value = NSManagedObject(entity: entity, insertInto: context)
            
            guard let ID = news.id else {
                completion(false, CoreDataError.addToFavoritesFailure)
                return
            }
            
            let createdTime = Date.currentTimeMillis()
            let imageData   = Data.getImageDataFrom(url: news.imageURL)
            let thumbnailData = Data.getImageDataFrom(url: news.thumbnailURL)
            
            value.setValue(ID, forKeyPath: "id") //int
            value.setValue(createdTime, forKeyPath: "createdTime") //double
            value.setValue(news.abstract ?? "", forKeyPath: "news")  //String
            value.setValue(news.title ?? "", forKeyPath: "title") //String
            value.setValue(imageData, forKeyPath: "image") //Data
            value.setValue(thumbnailData, forKeyPath: "thumbnail") //Data
            
            do {
                try context.save()
            }
            catch let error as NSError {
                let _ = error
                completion(false, CoreDataError.addToFavoritesFailure)
            }
            
            completion(true, nil)
        }
    }
    
    func getNews(completion:@escaping GetNewsHandler) {
        if let records = getAllRecordsWith(entityName) {
            let container = self.persistentContainer
            container.performBackgroundTask { (context) in
                var newsTemp = [News]()
                for entity in records {
                    if let news = self.getNewsFrom(entity: entity) {
                        newsTemp.append(news)
                    }
                }
                newsTemp.count > 0 ? completion(newsTemp.sorted(by: { ($0.createdToDB ?? 0) > ($1.createdToDB ?? 0) })) : completion(nil)
            }//performBackgroundTask
        }//getAllRecordsWith
    }
    
    func deleteNews(news: [News], completion: @escaping SuccessHandler) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        let container = self.persistentContainer
        container.performBackgroundTask { (context) in
            
            for n in news {
                guard let ID = n.id else {
                    completion(false)
                    return
                }
                fetchRequest.predicate = NSPredicate(format: "id = %@", "\(ID)")
                if let value = try? context.fetch(fetchRequest).first as? NSManagedObject {

                    context.delete(value)
                }
            }
            
            do {
                try context.save()
                completion(true)
            }
            catch {
                completion(false)
            }
        }
    }
    
    func isFavoritesNews(_ newsID: Int) -> Bool {
        return !checkClone(id: newsID)
    }
    
    //MARK: - Private
    private func getNewsFrom(entity: NSManagedObject) -> News? {
        if let ID = entity.value(forKey: "id") as? Int {
            
            let title = entity.value(forKey: "title") as? String
            let image = entity.value(forKey: "image") as? Data
            let thumbnail = entity.value(forKey: "thumbnail") as? Data
            let news = entity.value(forKey: "news") as? String
            let createdTime = entity.value(forKey: "createdTime") as? Double
            
            return News(uri: nil, url: nil, id: ID, asset_id: nil, source: nil, published_date: nil, updated: nil, section: nil, subsection: nil, nytdsection: nil, adx_keywords: nil, byline: nil, type: nil, title: title, abstract: news, des_facet: nil, org_facet: nil, per_facet: nil, geo_facet: nil, media: nil, eta_id: nil, createdToDB: createdTime, imageDataFromDB: image, thumbnailDataFromDB: thumbnail)
        }
        return nil
    }
    
    private func checkClone(id: Int) -> Bool {
        guard let newsArray = CoreData.shared.getAllRecordsWith(entityName) else { return false }
        for news in newsArray {
            guard let ID = news.value(forKey: "id") as? Int else {
                return false
            }
            if ID == id {
                return false
            }
        }
        return true
    }
    
    private func getAllRecordsWith(_ entityName: String) -> [NSManagedObject]? {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: entityName)
        
        do {
            let values = try MOC.fetch(fetchRequest)
            return values
        }
        catch let error as NSError {
            let _ = error
            return nil
        }
    }
}

//
//  ErrandsCache.swift
//  Errands
//
//  Created by Chris Woodard on 10/15/16.
//  Copyright © 2016 ToDo. All rights reserved.
//

import UIKit

public enum CacheError {
    case NoError
    case NoSuchErrand
    case SQLError(String)
}

class ErrandsCache: NSObject {

    var dbIsOpen:Bool = false
	var lastError:Error? = nil
    var db: OpaquePointer? = nil
	var versions:[String] = [
        "1.0"
    ]
	var cachePath:String = ""
    
	static let sharedCache = ErrandsCache()
	
	private override init() {
        let fileURL = try! FileManager.default.url(for: .cachesDirectory, in: .userDomainMask,
                                                   appropriateFor: nil, create: false).appendingPathComponent("Errands.db")
        self.cachePath = fileURL.path
	}

    //open db
    func dbOpen() -> Int32 {
        var result = sqlite3_open(self.cachePath as String, &self.db)
        if SQLITE_OK == result{
            self.dbIsOpen = true;
        }
        return result
    }
    
    //close db
    func dbClose() -> Int32 {
        var result = SQLITE_OK
        
        result = sqlite3_close(db)
        if SQLITE_OK == result {
            self.dbIsOpen = false
            db = nil
        }
        return result
    }
    
    //add user
	func add(User:[String:Any]) -> (CacheError, Int, Int64) {
        if false == self.dbIsOpen {
            _ = self.dbOpen()
        }
        
		var err:CacheError = .NoError
        var changes:Int = 0
        var lastInsertId:Int64 = -1

//MARK4

        return (err, changes, lastInsertId)
	}
	
	func errands() -> (CacheError, [String:[[String:Any]]]) {
		var err:CacheError = .NoError
        var errands:[String:[[String:Any]]] = [:]

//MARK5

        return (err, errands)
	}
	
    //fetch errand
	func errand(id:Int64) -> (CacheError, [String:Any]?) {
		var err:CacheError = .NoError
        var errand:[String:Any]? = nil
        
        if false == self.dbIsOpen {
            _ = self.dbOpen()
        }

//MARK6

        return (err, errand)
	}
	
    //update errand
	func update(id:Int64, errand:[String:Any]) -> (CacheError, Int) {
		var err:CacheError = .NoError
        var changes:Int = 0
        let fmtr = DateFormatter()
        
        if false == self.dbIsOpen {
            _ = self.dbOpen()
        }

//MARK7
        
        return (err, changes)
	}
	
    //delete errand
	func delete(id:Int64) -> (CacheError, Int) {
		var err:CacheError = .NoError
        var changes:Int = 0
        
        if false == self.dbIsOpen {
            _ = self.dbOpen()
        }

//MARK8

        return (err, changes)
	}

/* --------------------------------------------------------------------------------
    This is code to implement creating Errands.db with scripts and migrate it from 
    an old to a new schema when feature changes require db changes.  It's designed 
    to update the db in place so the user doesn't lose cached data.
    
    This works by maintaining two different types of version-specific SQL scripts:  
    
        create_X.Y 
        migrate_X.Y_X.Y
     
    and figuring out, at runtime, which one to use.
   -------------------------------------------------------------------------------- */

/* --------------------------------------------------------------------------------
    This loads and parses one of the SQL scripts in the app bundle.  It returns an
    array of strings, each string containing a SQL statement or command.
   -------------------------------------------------------------------------------- */
    func sqlContents(name:String) -> [String?]? {
        var sqlText:[String]? = nil
        if let sqlPath = Bundle.main.path(forResource: name, ofType: "sql") {
            do {
                let sqlRawText = try String(contentsOfFile: sqlPath)
                sqlText = sqlRawText.components(separatedBy: ";")
            }
            catch {
                //todo: log error
            }
        }
        return sqlText
    }
    
/* --------------------------------------------------------------------------------
    This constructs a "create_X.y" script name so that the contents of a specific
    creation script can be loaded.
   -------------------------------------------------------------------------------- */
	func creationSQL(version:String) -> [String?]? {
		return sqlContents(name: "create_\(version)")
	}
    
/* --------------------------------------------------------------------------------
    This constructs a "migrate_<version>_<version> to load a script that has the
    SQL statements and commands needed to modify the schema and rows from an older
    version to the current version.
   -------------------------------------------------------------------------------- */
    func migrationSQL(from:String, to:String) -> [String?]? {
        return sqlContents(name: "migrate_\(from)_\(to)")
    }
    
/* --------------------------------------------------------------------------------
    This creates the database schema for a given version.
   -------------------------------------------------------------------------------- */
	func createDb(version:String) -> CacheError {
        var err:CacheError = .NoError
        if let sqlStatments = creationSQL(version: version) {
            for sqlStmt in sqlStatments {
                let result = sqlite3_exec(self.db, sqlStmt!, nil, nil, nil)
                if SQLITE_OK != result {
                    let errStr = String(cString: sqlite3_errstr(result))
                    err = .SQLError(errStr)
                }
            }
        }
        else {
            err = .SQLError("No such create script: \(version)")
        }

        return err
	}
		
/* --------------------------------------------------------------------------------
    This migrates the db, in place, from an old version to a newer version
   -------------------------------------------------------------------------------- */
    func migrateDb(from:String, to:String) -> CacheError {
        var err:CacheError = .NoError
        if let sqlStatments = migrationSQL(from: from, to: to) {
            for sqlStmt in sqlStatments {
                let result = sqlite3_exec(self.db, sqlStmt, nil, nil, nil)
                if SQLITE_OK != result {
                    let errStr = String(cString: sqlite3_errstr(result))
                    err = .SQLError(errStr)
                }
            }
        }
        else {
            err = .SQLError("No such migration script: \(from)_\(to)")
        }

        return err
    }
    
/* --------------------------------------------------------------------------------
    This returns the version in the db.
   -------------------------------------------------------------------------------- */
	func cachedVersion() -> String? {
        var version:String? = nil
        var stmt:OpaquePointer? = nil
        
        var result = sqlite3_prepare_v2(db, "SELECT version from Version", -1, &stmt, nil)
        if SQLITE_OK == result {
            result = sqlite3_step(stmt)
            if SQLITE_ROW == result {
                if let rawTxt = sqlite3_column_text(stmt, 0) {
                    version = String(cString:rawTxt)
                }
            }
            sqlite3_finalize(stmt)
        }
        return version
    }

/* --------------------------------------------------------------------------------
    This method gets called after the first time we allocate the singleton.  It 
    compares the cached version against the current version (last node in the
    version history array) and decides whether the db needs to be created or
    migrated from an existing schema version.
   -------------------------------------------------------------------------------- */
	func prepare() -> CacheError {
        var err:CacheError = .NoError
        _ = self.dbOpen()
        if let currentVersion = self.versions.last {
            if let cachedVersion = self.cachedVersion() {
                if cachedVersion != currentVersion {
                    // if cached version doesn't match current version, we need to migrate it
                    err = self.migrateDb(from: cachedVersion, to: currentVersion)
                }
            }
            else {
                // if cached version came back nil, we assume db doesn't exist and create it
                // with current version
                err = self.createDb(version: currentVersion)
            }
        }
        return err
	}

}

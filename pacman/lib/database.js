'use strict';

const MongoClient = require('mongodb').MongoClient;
const config = require('./config');
let _db;

class Database {
    async connect(app) {
        try {
            const client = await MongoClient.connect(config.database.url, config.database.options);
            _db = client.db();
            app.locals.db = _db;
        } catch (err) {
            console.error('Failed to connect to database:', err);
            console.error('URL:', config.database.url);
            console.error('Options:', config.database.options);
            throw err; // Rethrow to handle higher up
        }
    }

    async getDb(app) {
        if (!_db) {
            await this.connect(app);
        }
        return _db;
    }
}

module.exports = new Database();

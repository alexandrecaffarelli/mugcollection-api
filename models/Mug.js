const client = require('./client');

module.exports = class Mug {

    // static method to pull all mugs from database
    static async findAll() {
        const result = await client.query('SELECT * FROM "get_mugs"();');
        return result.rows;
    };

    // prototype method to insert instantiated mug into database
    async save() {
        const result = await client.query('SELECT * FROM "new_mug"($1);', [this]);
        this.id = result.rows[0].id;
    };

}
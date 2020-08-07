const client = require('./client');

module.exports = class Mug {

    // static method to pull all mugs from database
    static async findAll() {
        const result = await client.query('SELECT * FROM "collection"."get_mugs"();');
        return result.rows;
    };

    // static method to pull a single mug from database using its id
    static async findById(id) {
        const result = await client.query('SELECT * FROM "collection"."get_mug"($1);', [id]);
        const mug = new Mug();
        Object.assign(mug, result.rows[0]);
        return mug;
    };

    // prototype method to modify data (is_clean, last_usage) from instantiated mug into database
    async use() {
        const result = await client.query('SELECT * FROM "collection"."use_mug"($1);', [this.id]);
        Object.assign(this, result.rows[0]);
    };

    // prototype method to modify data (is_clean) from instantiated mug into database    
    async clean() {
        const result = await client.query('SELECT * FROM "collection"."clean_mug"($1);', [this.id]);
        Object.assign(this, result.rows[0]);
    };

    // prototype method to insert instantiated mug into database
    async save() {
        const result = await client.query('SELECT * FROM "collection"."new_mug"($1);', [this]);
        this.id = result.rows[0].id;
    };

    // prototype method to remove instantiated mug from database
    async remove() {
        await client.query('SELECT * FROM "collection"."remove_mug"($1);', [this.id]);
    };

    // prototype method to update state of an instantiated mug from database
    async updateState() {
        await client.query('SELECT * FROM "collection"."update_state_mug"($1, $2);', [this.id, this.state]);
    };
}
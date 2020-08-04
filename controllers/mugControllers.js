const Mug = require('../models/Mug');

module.exports = {

    // method to pull all mugs from database
    getAll: async (_, response) => {
        response.json({
            data: await Mug.findAll()
        });
    },

    // method to pull a mug from database using its id
    getById: async (request, response) => {
        const mugId = request.params.id;
        response.json({
            data: await Mug.findById(mugId)
        })
    },

    // method to create a new mug
    create: async (request, response) => {
        const mug = new Mug();
        Object.assign(mug, request.body);
        await mug.save();

        response.json({
            data: mug
        });
    },

    use: (request, response) => {

    },

    todo: (_, response) => {
        response.json({
            status: "todo"
        });
    }

}; 
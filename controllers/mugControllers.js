const Mug = require('../models/Mug');

module.exports = {

    getAll: async (_, response) => {
        response.json({
            data: await Mug.findAll()
        });
    },

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
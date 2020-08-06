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

    // method to specify that a mug has been used
    use: async (request, response, next) => {
        const mugId = request.params.id;
        const mug = await Mug.findById(mugId);
        if (mug.id !== null) {
            if (!mug.is_clean) {
                response.json("The mug has already been used, you should clean it before using it again you disgusting pig!");
            } else {
                await mug.use();
                response.json({
                    data: mug
                });
            };
        } else {
            next();
        };
    },

    // method to specify that a mug has been cleaned
    clean: async (request, response, next) => {
        const mugId = request.params.id;
        const mug = await Mug.findById(mugId);
        if (mug.id !== null) {
            if (mug.is_clean) {
                response.json("The mug is already clean!")
            } else {
                await mug.clean();
                response.json({
                    data: mug
                });
            };
        } else {
            next();
        };    
    },

    // method to remove a selected mug from database
    remove: async (request, response, next) => {
        const mugId = request.params.id;
        const mug = await Mug.findById(mugId);
        if (mug.id !== null) {
            await mug.remove();
            response.json("The mug has been removed from your collection!");
        } else {
            next();
        };  
    },

    // method to update state of a selected mug from database   
    updateState: async (request, response, next) => {
        const mugId = request.params.id;
        const mugNewState = request.body.state;
        const mug = await Mug.findById(mugId);
        if (mug.id !== null) {
            mug.state = mugNewState;
            await mug.updateState();
            response.json({
                data: mug
            });
        } else {
            next();
        };
    }
}; 
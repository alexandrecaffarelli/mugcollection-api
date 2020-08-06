const Joi = require ('@hapi/joi');

module.exports = {

    // method to validate mug information sent by client using joi
    validateMug: async (request, response, next) => {
        try {
            const JoiSchema = Joi.object({
                label: Joi.string().pattern(/^(([A-Za-z0-9]+)(\s|$))+/).required(),
                capacity: Joi.number().integer().required(),
                last_usage: Joi.date().timestamp(),
                is_clean: Joi.boolean(),
                description: Joi.string(),
                state: Joi.string()
            });
            const validation = JoiSchema.validate(request.body);
            if (validation.error) {
                response.status(400).json(validation.error.details);
            } else {
                console.log('Validated Data');
                next();
            };
        } catch (error) {
            response.statut(500).json(error);
        }
    },

    // method to validate updated mug state sent by client using joi
    validateState: async (request, response, next) => {
        try {
            const JoiSchema = Joi.object({
                state: Joi.string()
            });
            const validation = JoiSchema.validate(request.body);
            if (validation.error) {
                response.status(400).json(validation.error.details);
            } else {
                console.log('Validated Data');
                next();
            };
        } catch (error) {
            response.statut(500).json(error);
        }
    }

} 
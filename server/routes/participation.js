const express = require("express");

function participationRouter(pgClient) {
    const router = express.Router();

    router.get("/", async (req, res) => {
        const result = await pgClient.query({
            text: 'SELECT * FROM participations ',
        });
        if (result.rows == null)
            res.status(404).send("Not found");
        else
            res.status(200).json(result.rows);

        return;

    });

    router.get("/event/:id", async (req, res) => {

        const result = await pgClient.query({
            text: 'SELECT * FROM participations WHERE event_id=$1',
            values: [req.params.id]
        });
        if (result.rows == null)
            res.status(404).send("Not found");
        else
            res.status(200).json(result.rows);

        return;

    });

    router.get("/user/:id", async (req, res) => {

        const result = await pgClient.query({
            text: 'SELECT * FROM participations WHERE user_id=$1',
            values: [req.params.id]
        });
        if (result.rows == null)
            res.status(404).send("Not found");
        else
            res.status(200).json(result.rows);

        return;

    });

    router.post("/", async (req, res) => {
        const body = req.body;
        console.log(req.session.user.id+"  "+ body.event_id);

        if (req.session.user.id == null)
            res.status(400).send("Vous devez vous authentifier !!");
        else {
            const result_1 = await pgClient.query({
                text: "SELECT id FROM participations WHERE user_id=$1 and event_id=$2",
                values: [req.session.user.id, body.event_id]
            })
            const result_2 = await pgClient.query({
                text: "SELECT available_seats FROM events WHERE id=$1",
                values: [body.event_id]
            })

            if (result_1.rows[0] != null)
                res.status(400).send("Vous participez deja a l'evenement");
            else if (result_2.rows[0].available_seats == 0) {
                res.status(400).send("Toutes les places sont prises");
            }
            else {
                console.log(req.session.user.id+"  "+ body.event_id);
                const result_3 = await pgClient.query({
                    text: "INSERT INTO participations(user_id,event_id) VALUES($1,$2)",
                    values: [req.session.user.id, body.event_id]
                });
                console.log(result_3);

                const result_4 = await pgClient.query({
                    text: "UPDATE events SET available_seats=$1 WHERE id=$2",
                    values: [result_2.rows[0].available_seats-1, body.event_id]
                });
                res.status(200).send("OK");
            }

        }
        return;
    });

    router.delete("/event/:id", async (req, res) => {

        if (req.session.user.id == null)
            res.status(400).send("Vous devez vous authentifier !!");
        else {
            const result = await pgClient.query({
                text: " DELETE FROM participation WHERE event_id=$1 and user_id=$2",
                values: [req.params.id, req.session.user.id]
            });

            const result_2 = await pgClient.query({
                text: "SELECT available_seats FROM events WHERE id=$1",
                values: [req.params.id]
            });

            const result_3= await pgClient.query({
                text: "UPDATE events SET available_seats=$1 WHERE id=$2",
                values: [result_2.rows[0].available_seats+1,req.params.id]
            });
        }
        res.status(200).send("Deleted");
        return;
    });

    return router;

}


module.exports = participationRouter;
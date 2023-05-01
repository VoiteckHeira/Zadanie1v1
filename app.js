const express = require('express');
const moment = require('moment-timezone');
const app = express();
const port = 3000;

const authorName = 'Jan Kowalski';
const serverStartTime = moment().tz('Europe/Warsaw').format();

app.listen(port, () => {
    console.log(`Serwer został uruchomiony. 
               Autor: ${authorName}. 
               Port: ${port}. 
               Data uruchomienia: ${serverStartTime}`);
});

app.get('/', (req, res) => {
    const clientIP = req.ip;
    const clientTime = moment().tz(moment.tz.guess()).format();
    res.send(`Adres IP klienta: ${clientIP}. Czas klienta: ${clientTime}.`);
});